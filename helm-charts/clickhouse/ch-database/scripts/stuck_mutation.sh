#!/bin/bash

# Show help
show_help() {
  echo "Usage: $0 <database_name> <table_name> [--execute]"
  echo ""
  echo "Description:"
  echo "  This script resolves stuck mutations in ClickHouse by checking the"
  echo "  system.mutations table and performing actions if needed."
  echo ""
  echo "Arguments:"
  echo "  <database_name>    Name of the ClickHouse database"
  echo "  <table_name>       Name of the table where mutation is stuck"
  echo "  [--execute]        Execute actions directly instead of dry-run (optional)"
}

# Check if help is requested
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
  show_help
  exit 0
fi

# Check if both arguments are passed
if [[ $# -lt 2 ]]; then
  echo "❌ Error: Invalid arguments."
  show_help
  exit 1
fi

# Set mode based on --execute flag
MODE="dry-run"
if [[ "$3" == "--execute" ]]; then
  MODE="execute"
fi

echo "Mode: $MODE"

# Stop execution on any error
set -e
trap 'echo "❌ Error occurred on line $LINENO while executing: $BASH_COMMAND"; exit 1' ERR

# Get the replica_names from the cluster
readarray -t hosts < <(clickhouse-client --query="SELECT host_name FROM system.clusters WHERE cluster = 'vusmart'" --format=TabSeparated)

# Dynamically create variables for each replica
index=1
for host in "${hosts[@]}"; do
  eval "host$index=\"$host\""
  ((index++))
done

# Print the replica_name extracted
echo "Replicas in the cluster:"
for host in "${hosts[@]}"; do
  echo "📌 $host"
done
echo " "

# Get the distinct table_name and db_name where mutation is stuck
DATABASE=$1
TABLE=$2

# Step 1: Check for stuck mutations in each replica
for host in "${hosts[@]}"; do
  echo "🔍 Checking for stuck mutations on table: $TABLE on $host"
  echo " "
  MUTATION_PARTS=$(clickhouse-client -h $host --query="SELECT DISTINCT arrayJoin(parts_to_do_names) FROM system.mutations WHERE database = '$DATABASE' AND table = '$TABLE' AND is_done = 0")
  echo "$MUTATION_PARTS"
  
  # If no stuck mutations, continue the checks on the next replica
  if [ -z "$MUTATION_PARTS" ]; then
    echo "No stuck mutations found."
    echo " "
    continue
  fi

  echo "⚠️ Stuck mutations found. Parts to process: $MUTATION_PARTS on '$host'"
  echo " "

  # Convert multi-line variable into a single-line comma-separated string
  MUTATION_PARTS_LIST=$(echo "$MUTATION_PARTS" | sed "s/^/'/" | sed "s/$/'/" | paste -sd "," -)

  # Step 2: Check if parts are in system.detached_parts with reason 'broken-on-start'
  echo "🔍 Checking for erroneous parts in system.detached_parts with reason 'broken-on-start'..."
  echo " "

  DETACHED_PARTS=$(clickhouse-client -h $host --query="SELECT name FROM system.detached_parts WHERE database = '$DATABASE' AND table = '$TABLE' AND reason = 'broken-on-start' AND name IN ($MUTATION_PARTS_LIST)")
  echo "⚠️ Detached parts: $DETACHED_PARTS"
  echo " "
  MUTATION_PARTS_ARRAY=$(echo "$MUTATION_PARTS_LIST" | sed "s/ /','/g")
  MUTATION_PARTS_ARRAY="[$MUTATION_PARTS_ARRAY]"

  # If broken parts are found, generate DROP DETACHED PART queries
  if [ -n "$DETACHED_PARTS" ]; then
  	echo "🛠️ Broken parts found, generating DROP DETACHED PART queries..."
	echo " "
     	clickhouse-client -h $host --query="SELECT 'ALTER TABLE ' || database || '.' || table || ' DROP DETACHED PART \'' || name || '\' settings allow_drop_detached=1;' AS sql
     	FROM system.detached_parts WHERE table = '$TABLE' AND reason = 'broken-on-start'
     	AND has(($MUTATION_PARTS_ARRAY), substr(name, position(name, '_') + 1))
     	INTO OUTFILE 'drop_broken_parts.sql' TRUNCATE AND STDOUT FORMAT TSVRaw"
     	echo "📄 ✅ DROP DETACHED PART queries generated in drop_broken_parts.sql."
     	echo " "

	if [[ "$MODE" == "execute" ]]; then

      		# Execute the SQL to drop the detached parts in each replica
      		echo "🚀 Executing DROP DETACHED PART queries on: $host"
      		clickhouse-client -h "$host" -mn < drop_broken_parts.sql
    	else
      		echo "👉 [Dry-run] DROP DETACHED PART queries would be generated."
      		echo "👉 The following actions would be executed on $host:"
		cat drop_broken_parts.sql
    	fi
  else
    	echo "✅ No broken detached parts found."
  fi

  # Step 3: Check if the stuck mutation has finished executing
  echo "🔍 Checking if the mutation has finished executing..."
  echo " "
  MUTATION_STATUS=$(clickhouse-client -h $host --query="SELECT parts_to_do_names FROM system.mutations WHERE database = '$DATABASE' AND table = '$TABLE' AND is_done = 0")

  # If still stuck, kill the mutation
  if [ -n "$MUTATION_STATUS" ]; then
	if [[ "$MODE" == "execute" ]]; then
  		echo "Mutation still stuck, killing mutation..."
      		clickhouse-client --query="KILL MUTATION WHERE database = '$DATABASE' AND table = '$TABLE'"
    	else
      		echo "👉 [Dry-run] Mutation would be killed."
		echo "👉 KILL MUTATION WHERE database = '$DATABASE' AND table = '$TABLE'" 
    	fi
  else
    echo "Mutation has finished executing."
  fi

  # Step 4: Check for stuck parts in the replication queue
  echo " "
  echo "🔍 Checking for stuck parts in the replication queue..."

  REPLICATION_QUEUE=$(clickhouse-client -h $host --query="SELECT new_part_name, type, create_time FROM system.replication_queue WHERE database = '$DATABASE' AND table = '$TABLE' AND is_currently_executing AND has($MUTATION_PARTS_ARRAY, new_part_name)")

  if [ -n "$REPLICATION_QUEUE" ]; then
	echo " "
  	echo "⚠️ Stuck part found in the replication queue."
        echo " "

    	if [[ "$MODE" == "execute" ]]; then
      		echo "🛠️ Rebuilding parts metadata..."
      		echo "⚠️ WARNING: You are about to DETACH tables and DROP REPLICA metadata from ClickHouse!"
      		echo "👉 These actions are irreversible and might cause data loss if not done correctly."
                echo " "

      		read -p "❓ Are you sure you want to proceed? (yes/no): " confirm
      		if [[ "$confirm" != "yes" ]]; then
        		echo "❌ Operation cancelled."
        		exit 1
      		fi

      		for host in "${hosts[@]}"; do
        		echo "Rebuilding the parts on: $host"
        		clickhouse-client -h "$host" --query="DETACH TABLE '$DATABASE'.'$TABLE'"
        	sleep 1
      		done
		echo " "

      		for host in "${hosts[@]}"; do
        		echo "Rebuilding the parts on: $host"
        		clickhouse-client -h "$host" --query="SYSTEM DROP REPLICA '$host' FROM ZKPATH (SELECT zookeeper_path FROM system.replicas WHERE database='$DATABASE' AND table='$TABLE')"
        		sleep 1
      		done
		echo " "

      		for host in "${hosts[@]}"; do
        		echo "Rebuilding the parts on: $host"
        		clickhouse-client -h "$host" --query="ATTACH TABLE '$DATABASE'.'$TABLE'"
        		sleep 1
      		done
		echo " "

      		for host in "${hosts[@]}"; do
        		echo "Rebuilding the parts on: $host"
        		clickhouse-client -h "$host" --query="SYSTEM RESTORE REPLICA '$DATABASE'.'$TABLE'"
        		sleep 1
      		done
		echo " "

      		for host in "${hosts[@]}"; do
        		echo "Rebuilding the parts on: $host"
        		clickhouse-client -h "$host" --query="SYSTEM SYNC REPLICA '$DATABASE'.'$TABLE'"
        		sleep 1
        		if [ $? -ne 0 ]; then
          			echo "❌ Error occurred during SYNC REPLICA on $host."
          			exit 1
        		fi
      		done
		echo " "

      	echo "Replication queue and metadata rebuilt successfully."
    	else
		echo " "
      		echo "👉 [Dry-run] Replication queue rebuild would be performed."
      		echo "👉 The following actions would be executed on all replicas:"
      		echo "  1. DETACH TABLE '$DATABASE'.'$TABLE'"
      		echo "  2. SYSTEM DROP REPLICA '$host'"
      		echo "  3. ATTACH TABLE '$DATABASE'.'$TABLE'"
      		echo "  4. SYSTEM RESTORE REPLICA '$DATABASE'.'$TABLE'"
      		echo "  5. SYSTEM SYNC REPLICA '$DATABASE'.'$TABLE'"
    	fi
  else
    echo "No stuck parts found in the replication queue."
  fi

  echo "✅ Execution completed on $host."
  echo " "
done

echo "✅ Stuck mutation is checked on all replicas."

