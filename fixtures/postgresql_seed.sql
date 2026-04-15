-- vuSmartMaps PostgreSQL Seed Data
-- Loads minimal test data for local development validation
-- Target database: multicore (user: vusmart)

-- Insert test cache entries
INSERT INTO vusoft_vusoftcache (key, value)
SELECT 'test_tenant', '{"name": "Test Org", "environment": "local"}'
WHERE NOT EXISTS (SELECT 1 FROM vusoft_vusoftcache WHERE key = 'test_tenant');

INSERT INTO vusoft_vusoftcache (key, value)
SELECT 'test_config', '{"debug": true, "local_dev": true, "version": "2.16"}'
WHERE NOT EXISTS (SELECT 1 FROM vusoft_vusoftcache WHERE key = 'test_config');

INSERT INTO vusoft_vusoftcache (key, value)
SELECT 'test_feature_flags', '{"new_dashboard": true, "alerts_v2": false}'
WHERE NOT EXISTS (SELECT 1 FROM vusoft_vusoftcache WHERE key = 'test_feature_flags');
