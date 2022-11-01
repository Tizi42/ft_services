#!/bin/sh
telegraf &

openrc default
rc-update add sshd
/etc/init.d/sshd start

nginx -g "daemon off;"
