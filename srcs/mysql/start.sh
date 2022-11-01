#!/bin/sh

telegraf &

openrc default
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

echo "CREATE DATABASE wpdb; \
      GRANT ALL ON wpdb.* TO 'wpdb_admin'@'%' IDENTIFIED BY 'wpdb_pw' WITH GRANT OPTION; \
      FLUSH PRIVILEGES;" | mysql

mysql -u root wpdb < wpdb.sql

tail -f /dev/null
