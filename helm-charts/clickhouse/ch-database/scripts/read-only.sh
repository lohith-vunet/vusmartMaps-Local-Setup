#!/bin/bash
# RESOLUTION SCRIPT FOR READ_ONLY ISSUE IN CLICKHOUSE

show_help() {
  echo "Usage: $0 [--execute]"
  echo ""
  echo "Description:"
  echo "  This script resolves read-only issues in ClickHouse by detaching, dropping,"
  echo "  and restoring replicas."
  echo ""
  echo "  Options:"
  echo "  [--execute]        Execute actions directly instead of dry-run (optional)"
}

# Default mode
mode="dry-run"

# Handle flags
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
  show_help
  exit 0
elif [[ "$1" == "--execute" ]]; then
  mode="execute"
fi

set -e
trap 'echo "Error occurred on line $LINENO while executing: $BASH_COMMAND"; exit 1' ERR

#If Authentication is required
#user=
#password=

# Get replica hosts from cluster
readarray -t hosts < <(clickhouse-client --query="SELECT distinct(host_name) FROM system.clusters where cluster='vusmart'" --format=TabSeparated)

#Dynamically create variables for each replica
index=1
for host in "${hosts[@]}"; do
    eval "host$index=\"$host\""
    ((index++))
done

#print the replica_name extracted
echo "📌 List of replicas:"
for host in "${hosts[@]}"; do
    echo " - $host"
    echo " "
done
echo " "

# ==================== DRY-RUN OR EXECUTION ======================
if [[ "$mode" == "dry-run" ]]; then
	echo ""
	echo "👉 DRY RUN: Listing read-only tables and their respective operations..."

	# Query to get all read-only tables with details
	readarray -t readonly_tables < <(
	clickhouse-client --query="SELECT DISTINCT database, table, replica_name, zookeeper_path 
	FROM clusterAllReplicas('vusmart', system.replicas) 
	WHERE is_readonly FORMAT TSV"
	)

	if [ ${#readonly_tables[@]} -eq 0 ]; then
		echo " "
 		 echo "✅ No read-only tables found. Nothing to do."
  		exit 0
	fi

	for row in "${readonly_tables[@]}"; do
  		db=$(echo "$row" | cut -f1)
  		tbl=$(echo "$row" | cut -f2)
  		replica=$(echo "$row" | cut -f3)
  		zk_path=$(echo "$row" | cut -f4)

  		echo " "
		echo "📌 Table: $db.$tbl"
		echo " "
  		echo "   🔹 Operation: DETACH TABLE $db.$tbl;"
  		echo "   🔹 Operation: SYSTEM DROP REPLICA '$replica' FROM ZKPATH '$zk_path';"
  		echo "   🔹 Operation: ATTACH TABLE $db.$tbl;"
  		echo "   🔹 Operation: SYSTEM RESTORE REPLICA $db.$tbl;"
  		echo "   🔹 Operation: SYSTEM SYNC REPLICA $db.$tbl;"
  		echo ""
	done

echo "💡 This is a DRY RUN. No commands have been executed."
echo "✅ If everything looks okay, run the script with: $0 --execute"
exit 0
fi

# ==================== EXECUTION BLOCK ======================
if [[ "$mode" == "execute" ]]; then

	#Generating the queries.

	# Step 1: Generate DETACH TABLE queries for all readonly tables in all replicas
	# The Database and table name will be retrieved from the system.replicas table
	echo "🛠️  Generating DETACH TABLE  queries for all readonly tables in all replicas..."
	clickhouse-client  --query="SELECT DISTINCT concat('DETACH TABLE ',database,'.',table,';') 
	FROM clusterAllReplicas('vusmart',system.replicas) 
	WHERE is_readonly INTO OUTFILE 'detach.sql' TRUNCATE AND STDOUT FORMAT TSVRaw"

	echo "📄 ✅ DETACH TABLE queries saved to detach.sql"
	echo " "


	# Step 2: Generate DROP REPLICA queries for all readonly tables in CH Keeper
	# The replica_name and zookeer_path will be retrieved from system.replicas table
	echo "🛠️  Generating DROP REPLICA  queries for all readonly tables in CH Keeper..."
	clickhouse-client --query=" SELECT DISTINCT concat('SYSTEM DROP REPLICA \'' ,replica_name,'\' FROM ZKPATH ''',zookeeper_path,''';')
	FROM clusterAllReplicas('vusmart',system.replicas)
	WHERE is_readonly INTO OUTFILE 'drop_replica.sql' TRUNCATE AND STDOUT FORMAT TSVRaw"

	echo "📄 ✅ DROP REPLICA queries saved to drop_replica.sql"
	echo " "

	# Step 3: Generate ATTACH TABLE queries for all readonly tables in all replicas
	echo "🛠️  Generating ATTACH TABLE queries for all readonly tables in all replicas..."
	clickhouse-client --query=" SELECT concat('ATTACH TABLE ',database,'.',table,';') 
	FROM clusterAllReplicas('vusmart',system.replicas) 
	WHERE is_readonly INTO OUTFILE 'attach.sql' TRUNCATE AND STDOUT FORMAT TSVRaw"

	echo "📄 ✅ ATTACH TABLE queries saved to attach.sql"
	echo " "

	# Step 4: Generate RESTORE REPLICA queries for all readonly tables in CH Keeper
	echo "🛠️  Generating RESTORE REPLICA queries for all readonly tables in CH Keeper..."
	clickhouse-client --query=" SELECT DISTINCT concat('SYSTEM RESTORE REPLICA ' ,database,'.',table,';')
	FROM clusterAllReplicas('vusmart',system.replicas)
	WHERE is_readonly INTO OUTFILE 'restore_replica.sql' TRUNCATE AND STDOUT FORMAT TSVRaw"

	echo "📄 ✅ RESTORE REPLICA queries saved to restore_replica.sql"
	echo " "

	# Step 5: Generate SYNC REPLICA queries for all readonly tables in CH Keeper
	echo "🛠️  Generating SYNC REPLICA queries for all readonly tables in CH Keeper..."
	clickhouse-client --query=" SELECT DISTINCT concat('SYSTEM SYNC REPLICA ' ,database,'.',table,';')
	FROM clusterAllReplicas('vusmart',system.replicas)
	WHERE is_readonly INTO OUTFILE 'sync_replica.sql' TRUNCATE AND STDOUT FORMAT TSVRaw"

	echo "📄 ✅ SYNC REPLICA queries saved to sync_replica.sql"
	echo " "


	#Step 6: Execute the generated SQL Queries

	# WARNING Before detaching and dropping the table

	echo "⚠️  WARNING: You are about to DETACH tables and DROP REPLICA metadata from ClickHouse!"
	echo "👉 These actions are irreversible and might cause data loss if not done correctly."
	echo
	read -p "❓ Are you sure you want to proceed? (yes/no): " confirm

	if [[ "$confirm" != "yes" ]]; then
  		echo "❌ Operation cancelled."
  		exit 1
	fi

	for host in "${hosts[@]}"; do
    		echo "🚀 Executing on $host"

    		cat detach.sql
    		echo "🚀 Executing DETACH TABLE SQL queries"
    		clickhouse-client -h "$host" -mn < detach.sql
    		sleep 1

    		cat drop_replica.sql
    		echo "🚀 Executing DROP REPLICA SQL queries"
    		clickhouse-client -h "$host" -mn < drop_replica.sql
    		sleep 1

    		cat attach.sql
    		echo "🚀 Executing ATTACH TABLE SQL queries"
    		clickhouse-client -h "$host" -mn < attach.sql
    		sleep 1

    		cat restore_replica.sql
    		echo "🚀 Executing RESTORE REPLICA SQL queries"
    		clickhouse-client -h "$host" -mn < restore_replica.sql
    		sleep 1

    		cat sync_replica
    		echo "🚀 Executing SYNC REPLICA SQL queries"
    		clickhouse-client -h "$host" -mn < sync_replica.sql
    		sleep 1

    		# Check if sync command was successful..?
    		if [ $? -ne 0 ]; then
        		echo "❌ Error during SYNC REPLICA on $host"
        		echo "⚠️  Please check and follow up manually."
        		exit 1
    		fi

    	echo "✅ Completed on $host"
    	echo ""
	done
fi

echo "🎉 All operations executed successfully."

