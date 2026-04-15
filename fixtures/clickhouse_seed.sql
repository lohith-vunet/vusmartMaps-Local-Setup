-- vuSmartMaps ClickHouse Seed Data
-- Loads sample monitoring data for local development validation
-- Target: monitoring database on clickhouse cluster 'vusmart'

-- Insert sample monitoring data (simulates Telegraf metrics)
INSERT INTO monitoring.monitoring_data (
    timestamp, host, measurement, field, value
) VALUES
    (now() - INTERVAL 10 MINUTE, 'test-server-1', 'cpu', 'usage_percent', 45.2),
    (now() - INTERVAL 10 MINUTE, 'test-server-1', 'memory', 'usage_percent', 62.8),
    (now() - INTERVAL 10 MINUTE, 'test-server-1', 'disk', 'usage_percent', 38.5),
    (now() - INTERVAL 10 MINUTE, 'test-server-2', 'cpu', 'usage_percent', 72.1),
    (now() - INTERVAL 10 MINUTE, 'test-server-2', 'memory', 'usage_percent', 81.3),
    (now() - INTERVAL 10 MINUTE, 'test-server-2', 'disk', 'usage_percent', 55.9),
    (now() - INTERVAL 5 MINUTE, 'test-server-1', 'cpu', 'usage_percent', 48.7),
    (now() - INTERVAL 5 MINUTE, 'test-server-1', 'memory', 'usage_percent', 63.1),
    (now() - INTERVAL 5 MINUTE, 'test-server-1', 'disk', 'usage_percent', 38.6),
    (now() - INTERVAL 5 MINUTE, 'test-server-2', 'cpu', 'usage_percent', 68.4),
    (now() - INTERVAL 5 MINUTE, 'test-server-2', 'memory', 'usage_percent', 79.5),
    (now() - INTERVAL 5 MINUTE, 'test-server-2', 'disk', 'usage_percent', 56.1),
    (now(), 'test-server-1', 'cpu', 'usage_percent', 51.3),
    (now(), 'test-server-1', 'memory', 'usage_percent', 64.2),
    (now(), 'test-server-1', 'disk', 'usage_percent', 38.7),
    (now(), 'test-server-2', 'cpu', 'usage_percent', 70.9),
    (now(), 'test-server-2', 'memory', 'usage_percent', 80.1),
    (now(), 'test-server-2', 'disk', 'usage_percent', 56.3);
