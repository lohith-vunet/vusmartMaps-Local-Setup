import os
import django

# Set up the Django environment
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mickey.core.settings")

# Forcefully set the environment variable to monitoring
os.environ["HS_DB_NAME"] = "monitoring"

# Initialize Django
django.setup()


from vu_auth_provider.hyperscale.tables.mgmt import hyperscale_create_additional_tables
from vu_auth_provider.hyperscale.tables.utils import (
    get_table_name_by_type,
    execute_hyperscale_query,
    init_hyperscale_client,
)

fluentbit_tables = [
    {
        "table_name": "vlogs_platform_kubelogs",
        "schema": "`timestamp` DateTime64(3), `inc_unix_time` UInt64, `log_level` String, `message` String, `message_lower` String, `host` String, `host_lower` LowCardinality(String), `pod_id` String, `pod_name` String, `container_name` String, `namespace_name` String",
        "engine": "ReplicatedMergeTree",
        "table_type": "materialized_view",
        "primary_key": "timestamp",
        "partition_by": "timestamp",
        "mv_query": [],
        "materialized_columns": "log_uuid UUID MATERIALIZED generateUUIDv4()",
        "database": "monitoring",
    },
    {
        "table_name": "vlogs_platform_k8s_events",
        "schema": "`timestamp` DateTime64(3), `inc_unix_time` UInt64, `event_type` String, `message` String, `message_lower` String, `host` String, `host_lower` LowCardinality(String), `object` String, `reason` String, `namespace_name` String, `pod_name` LowCardinality(String)",
        "engine": "ReplicatedMergeTree",
        "table_type": "materialized_view",
        "primary_key": "timestamp",
        "partition_by": "timestamp",
        "mv_query": [],
        "materialized_columns": "log_uuid UUID MATERIALIZED generateUUIDv4()",
        "database": "monitoring",
    },
]
# Initialise the clickhouse client
client = init_hyperscale_client()
for metadata in fluentbit_tables:
    try:
        hyperscale_create_additional_tables(metadata)
        table_name = get_table_name_by_type(metadata["table_name"], "REPLICATED_TABLE")
        # Applying TTL 1 day hot and 3 days warm to the replicated table
        alter_query = f"""
            ALTER TABLE monitoring.{table_name} MODIFY TTL
            toStartOfDay(timestamp) + INTERVAL 1 DAY TO VOLUME 'warm_volume',
            toStartOfDay(timestamp) + INTERVAL 4 DAY DELETE;
        """
        execute_hyperscale_query(client, alter_query)
    except Exception as e:
        error_msg = (
            f"Error while creating data ingestion layer {metadata['table_name']}: {e}"
        )
        print(error_msg)

