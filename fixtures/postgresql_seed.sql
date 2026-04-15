-- vuSmartMaps PostgreSQL Seed Data
-- Loads minimal test data for local development validation
-- Target database: vunet (default multicore db)

-- Insert a test tenant/organization
INSERT INTO vusoft_vusoftcache (key, value, created_at, updated_at)
SELECT 'test_tenant', '{"name": "Test Org", "environment": "local"}', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM vusoft_vusoftcache WHERE key = 'test_tenant');

-- Insert sample alert rule for testing
INSERT INTO vusoft_alertrule (name, description, severity, enabled, created_at, updated_at)
SELECT 'test-cpu-alert', 'Test alert: CPU usage > 90%', 'critical', true, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM vusoft_alertrule WHERE name = 'test-cpu-alert');

INSERT INTO vusoft_alertrule (name, description, severity, enabled, created_at, updated_at)
SELECT 'test-memory-alert', 'Test alert: Memory usage > 85%', 'warning', true, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM vusoft_alertrule WHERE name = 'test-memory-alert');

INSERT INTO vusoft_alertrule (name, description, severity, enabled, created_at, updated_at)
SELECT 'test-disk-alert', 'Test alert: Disk usage > 95%', 'critical', true, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM vusoft_alertrule WHERE name = 'test-disk-alert');

-- Insert sample device group
INSERT INTO vusoft_vusoftdevicegroup (name, description, created_at, updated_at)
SELECT 'local-test-servers', 'Test server group for local development', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM vusoft_vusoftdevicegroup WHERE name = 'local-test-servers');

-- Insert sample collection info
INSERT INTO vusoft_vusoftcollectioninfo (name, collection_type, enabled, interval_seconds, created_at, updated_at)
SELECT 'test-metric-collection', 'metrics', true, 60, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM vusoft_vusoftcollectioninfo WHERE name = 'test-metric-collection');

INSERT INTO vusoft_vusoftcollectioninfo (name, collection_type, enabled, interval_seconds, created_at, updated_at)
SELECT 'test-log-collection', 'logs', true, 30, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM vusoft_vusoftcollectioninfo WHERE name = 'test-log-collection');
