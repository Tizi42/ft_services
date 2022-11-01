#!/bin/sh
telegraf &

adduser -D -h / ftp_admin
echo "ftp_admin:ftp_pw" | chpasswd
echo "ftp_admin" >> /etc/vsftpd.userlist

vsftpd etc/vsftpd/my-vsftpd.conf
