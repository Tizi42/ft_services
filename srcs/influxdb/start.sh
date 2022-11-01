influxd &

echo "CREATE DATABASE ft_services;
CREATE USER influxdb_admin WITH PASSWORD 'influxdb_pw';
GRANT ALL ON ft_services TO influxdb_admin " | influx

telegraf
