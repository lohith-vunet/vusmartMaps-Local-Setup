import os
import django

# Set up the Django Environment
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mickey.core.settings")

# Initialize Django
django.setup()

from vu_auth_provider.hyperscale.tables.mgmt import hyperscale_create_data_ingestion_tables

metadata = {
  "table_name": "notification",
  "schema": "`tenant_id` UInt8, `bu_id` UInt8, `alert_id` String, `f_alert_id` String, `summary` String,  `description` String, `severity` String,  `alarm_state` String, `timestamp` DateTime64, `start_time` DateTime64,`duration` Float32,`grouping_values` String, `history` Map(String, Map(String, Float32)), `o11ysource_name` String,  `journey_name` String, `touch_point` String, `AppName` String,`component_name` String, `component_type` String, `ServerName` String,`enterprise_name` String, `metric_name` String, `Environment` String, `Location` String, `alert_rule_name` String, `tags` Array(String), `rules`  Map(String,  String),`host` String, `target` String,`related_dashboard` Array(String), `raw_events_ids` Array(String),`raw_events` Array(Map(String, String)),`workspace_id` UInt32,`workspace_name` String,`is_correlated` Bool,`correlation_technique` String,`correlation_type` String,`additional_info` String,`similar_incidents` Array(Map(String, String)),`insights` Array(String),`root_cause` String, `ticket_id` String, `type` String, `active_period_execution` Bool, `recommendations` String",
  "engine": "ReplicatedMergeTree",
  "primary_key": "alarm_state, timestamp",
  "topic": "notification",
  "partition_by": "timestamp",
  "table_type": "data_ingestion_table"
}

try:
    hyperscale_create_data_ingestion_tables(metadata)
except Exception as e:
    error_msg = f"Error while creating data ingestion layer {metadata['table_name']}: {e}"
    print(error_msg)
