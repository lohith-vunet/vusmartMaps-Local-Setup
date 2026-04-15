-- vuSmartMaps ClickHouse Seed Data
-- Loads sample monitoring data for local development validation
-- Target: monitoring database, cpu_data table

INSERT INTO monitoring.cpu_data (
    timestamp, host, cpu,
    usage_user, usage_system, usage_idle, usage_active,
    usage_iowait, usage_irq, usage_softirq, usage_steal,
    usage_guest, usage_guest_nice, usage_nice,
    time_user, time_system, time_idle, time_active,
    time_iowait, time_irq, time_softirq, time_steal,
    time_guest, time_guest_nice, time_nice
) VALUES
    (now() - toIntervalMinute(10), 'test-server-1', 'cpu-total', 25.3, 5.1, 69.6, 30.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    (now() - toIntervalMinute(10), 'test-server-2', 'cpu-total', 42.7, 8.3, 49.0, 51.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    (now() - toIntervalMinute(5), 'test-server-1', 'cpu-total', 28.1, 6.2, 65.7, 34.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    (now() - toIntervalMinute(5), 'test-server-2', 'cpu-total', 38.9, 7.1, 54.0, 46.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    (now(), 'test-server-1', 'cpu-total', 31.5, 4.8, 63.7, 36.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    (now(), 'test-server-2', 'cpu-total', 45.2, 9.6, 45.2, 54.8, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
