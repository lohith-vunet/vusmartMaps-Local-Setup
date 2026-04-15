#! /bin/bash

# Maximum number of attempts before giving up
MAX_ATTEMPTS=30

# Delay between connection attempts (in seconds)
DELAY=10

CH_CLUSTER="vusmart"


# Function to check if the database is up
check_database_up() {
  for ((i = 0; i < MAX_ATTEMPTS; i++)); do
    if clickhouse-client --host clickhouse.vsmaps --user vusmartmanager --password Vunet#1234 --query "SHOW DATABASES"; then
      echo -e "${GREEN}Database is up and running.${NC}"
      return 0
    fi
    echo "Database is not yet available. Retrying in $DELAY seconds..."
    sleep $DELAY
  done
  echo "Database is still not available after $MAX_ATTEMPTS attempts. Exiting."
  return 1
}

# Function to create a ClickHouse database
create_clickhouse_db() {
  for db in $(echo ${CLICKHOUSE_DBS}); do
    echo "Creating ClickHouse database: $db"
    clickhouse-client --host clickhouse.vsmaps --user vusmartmanager --password Vunet#1234 --query "CREATE DATABASE IF NOT EXISTS $db ON CLUSTER $CH_CLUSTER"
  done
}

# Check if the database is up
check_database_up

# If the database is up, create the ClickHouse database
if [ $? -eq 0 ]; then
  create_clickhouse_db
fi
