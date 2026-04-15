-- vuSmartMaps ClickHouse Seed Data
-- Loads sample monitoring data for local development e2e validation
-- Target: monitoring database on clickhouse cluster 'vusmart'

-- CPU metrics (simulates Telegraf infra collection)
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

-- Memory metrics
INSERT INTO monitoring.mem_data (
    timestamp, host,
    used_percent, available, total, used, free,
    cached, buffered, active, inactive,
    available_percent
) VALUES
    (now() - toIntervalMinute(10), 'test-server-1', 62.8, 6000000000, 16000000000, 10048000000, 5952000000, 3000000000, 500000000, 7000000000, 3000000000, 37.2),
    (now() - toIntervalMinute(10), 'test-server-2', 81.3, 3000000000, 16000000000, 13008000000, 2992000000, 2000000000, 300000000, 10000000000, 2000000000, 18.7),
    (now() - toIntervalMinute(5), 'test-server-1', 63.1, 5900000000, 16000000000, 10096000000, 5904000000, 3100000000, 500000000, 7100000000, 2900000000, 36.9),
    (now() - toIntervalMinute(5), 'test-server-2', 79.5, 3300000000, 16000000000, 12720000000, 3280000000, 2100000000, 300000000, 9800000000, 2200000000, 20.5),
    (now(), 'test-server-1', 64.2, 5700000000, 16000000000, 10272000000, 5728000000, 3200000000, 500000000, 7200000000, 2800000000, 35.8),
    (now(), 'test-server-2', 80.1, 3200000000, 16000000000, 12816000000, 3184000000, 2050000000, 300000000, 9900000000, 2100000000, 19.9);

-- Disk metrics
INSERT INTO monitoring.disk_data (
    timestamp, host, device, fstype, mode, path,
    total, free, used, used_percent, inodes_total, inodes_free, inodes_used
) VALUES
    (now() - toIntervalMinute(10), 'test-server-1', 'sda1', 'ext4', 'rw', '/', 500000000000, 307500000000, 192500000000, 38.5, 30000000, 28000000, 2000000),
    (now() - toIntervalMinute(10), 'test-server-2', 'sda1', 'ext4', 'rw', '/', 500000000000, 220500000000, 279500000000, 55.9, 30000000, 25000000, 5000000),
    (now(), 'test-server-1', 'sda1', 'ext4', 'rw', '/', 500000000000, 306500000000, 193500000000, 38.7, 30000000, 27900000, 2100000),
    (now(), 'test-server-2', 'sda1', 'ext4', 'rw', '/', 500000000000, 218500000000, 281500000000, 56.3, 30000000, 24800000, 5200000);
