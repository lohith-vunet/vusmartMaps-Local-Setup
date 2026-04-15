#!/usr/bin/env python3
import os
import sys
import django
import psycopg2 as pg
import copy


# Set up the Django environment
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mickey.core.settings")

# Initialize Django
django.setup()

from vu_auth_provider.hyperscale.tables.mgmt import (
    create_or_update_enrichment_hyperscale_dict,
)
from mickey.vusoft.vustreams import handle_enrichment as enrichment

enrichment_metadata = {
    "vinfo_global_o11y_dict": {
        "topic_name": "enrich-vinfo-global-o11y",
        "keys": [
            {
                "label": "source-id",
                "field_name": "source_id",
                "helptext": "source_id",
                "type": "string",
                "constraint": ".*",
                "isarray": False,
            }
        ],
        "values": [
            {
                "label": "aux-source-id",
                "field_name": "aux_source_id",
                "helptext": "aux_source_id",
                "type": "string",
                "isrequired": False,
                "isuppercase": False,
                "constraint": ".*",
                "isarray": False,
            },
            {
                "label": "category",
                "field_name": "category",
                "helptext": "category",
                "type": "string",
                "isrequired": False,
                "isuppercase": False,
                "constraint": ".*",
                "isarray": False,
            },
            {
                "label": "AppName",
                "field_name": "AppName",
                "helptext": "AppName",
                "type": "string",
                "isrequired": False,
                "isuppercase": False,
                "constraint": ".*",
                "isarray": False,
            },
            {
                "label": "ServerName",
                "field_name": "ServerName",
                "helptext": "ServerName",
                "type": "string",
                "isrequired": False,
                "isuppercase": False,
                "constraint": ".*",
                "isarray": False,
            },
            {
                "label": "Location",
                "field_name": "Location",
                "helptext": "Location",
                "type": "string",
                "isrequired": False,
                "isuppercase": False,
                "constraint": ".*",
                "isarray": False,
            },
            {
                "label": "Environment",
                "field_name": "Environment",
                "helptext": "Environment",
                "type": "string",
                "isrequired": False,
                "isuppercase": False,
                "constraint": ".*",
                "isarray": False,
            },
            {
                "label": "aux-data-1",
                "field_name": "aux_data_1",
                "helptext": "aux_data_1",
                "type": "string",
                "isrequired": False,
                "isuppercase": False,
                "constraint": ".*",
                "isarray": False,
            },
            {
                "label": "aux-data-2",
                "field_name": "aux_data_2",
                "helptext": "aux_data_2",
                "type": "string",
                "isrequired": False,
                "isuppercase": False,
                "constraint": ".*",
                "isarray": False,
            },
            {
                "label": "aux-data-3",
                "field_name": "aux_data_3",
                "helptext": "aux_data_3",
                "type": "string",
                "isrequired": False,
                "isuppercase": False,
                "constraint": ".*",
                "isarray": False,
            },
        ],
        "options": {},
        "table_name": "vinfo-global-o11y",
        "description": "vunet global enrichment table",
    }
}


enrichment.add_enrichment_metadata(1, 1, copy.deepcopy(enrichment_metadata), None)

# Creating the hyperscale dictionary for global O11y source enrichment
try:
    create_or_update_enrichment_hyperscale_dict(
        enrichment_metadata["vinfo_global_o11y_dict"]
    )
except Exception as e:
    print(f"Unable to add hyperscale dictionary : {e}")

# Modifying the postgres enrichment table properties.
sql_command = "ALTER TABLE vusoft_vusoftenrichmentdata REPLICA IDENTITY FULL;"
try:
    with pg.connect(
        host=os.environ.get("POSTGRES_HOST", os.environ.get("SQL_SERVER", "127.0.0.1")),
        user=os.environ.get("POSTGRES_USER", "vusmart"),
        database=os.environ.get("POSTGRES_DB", "multicore"),
        password=os.environ.get("POSTGRES_PASSWORD", "vusmart"),
    ) as conn:
        cur = conn.cursor()
        cur.execute(sql_command)
        # Commit the transaction
        conn.commit()
        print("Command executed successfully.")
except Exception as e:
    print(f"error while connecting to `cairo` db: {e}")
    sys.exit(1)

finally:
    # Close the cursor and connection
    cur.close()
    conn.close()
