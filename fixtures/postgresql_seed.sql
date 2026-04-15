-- vuSmartMaps PostgreSQL Seed Data
-- Loads test data for local development e2e validation
-- Target database: multicore (user: vusmart)

-- Cache entries for system configuration
INSERT INTO vusoft_vusoftcache (key, value)
SELECT 'test_tenant', '{"name": "Test Org", "environment": "local"}'
WHERE NOT EXISTS (SELECT 1 FROM vusoft_vusoftcache WHERE key = 'test_tenant');

INSERT INTO vusoft_vusoftcache (key, value)
SELECT 'test_config', '{"debug": true, "local_dev": true, "version": "2.16"}'
WHERE NOT EXISTS (SELECT 1 FROM vusoft_vusoftcache WHERE key = 'test_config');

INSERT INTO vusoft_vusoftcache (key, value)
SELECT 'test_feature_flags', '{"new_dashboard": true, "alerts_v2": false}'
WHERE NOT EXISTS (SELECT 1 FROM vusoft_vusoftcache WHERE key = 'test_feature_flags');

-- Sample data collection methods for ingestion validation
INSERT INTO vusoft_datacollectionmethod (dcm_id, name, agent_config_template)
SELECT 'test-snmp', 'test-snmp-collection', '{"type": "snmp", "interval": 60}'
WHERE NOT EXISTS (SELECT 1 FROM vusoft_datacollectionmethod WHERE dcm_id = 'test-snmp');

INSERT INTO vusoft_datacollectionmethod (dcm_id, name, agent_config_template)
SELECT 'test-syslog', 'test-syslog-collection', '{"type": "syslog", "port": 514}'
WHERE NOT EXISTS (SELECT 1 FROM vusoft_datacollectionmethod WHERE dcm_id = 'test-syslog');

-- Sample data streams for ingestion pipeline validation
INSERT INTO vusoft_datastreams (tenant_id, bu_id, name, partitions, description, created_at, updated_at)
SELECT 0, 0, 'test-metrics-stream', 1, 'Test metrics data stream', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM vusoft_datastreams WHERE name = 'test-metrics-stream');

INSERT INTO vusoft_datastreams (tenant_id, bu_id, name, partitions, description, created_at, updated_at)
SELECT 0, 0, 'test-logs-stream', 1, 'Test logs data stream', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM vusoft_datastreams WHERE name = 'test-logs-stream');
