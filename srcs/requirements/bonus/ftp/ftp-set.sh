#!/bin/bash

set -x

FTP_USER_PASSWORD=$(cat /run/secrets/ftp_user_password)

adduser --disabled-password --gecos "" ${FTP_USER}
usermod -d /var/www/html ${FTP_USER}
chown -R ${FTP_USER}:${FTP_USER} /var/www/html
echo "${FTP_USER}:${FTP_USER_PASSWORD}" | chpasswd
echo ${FTP_USER} >> /etc/vsftpd.user_list
usermod -s /bin/bash ${FTP_USER}

cat > /etc/vsftpd.conf << EOF
listen=YES
anonymous_enable=NO
xferlog_enable=YES
secure_chroot_dir=/var/run/vsftpd/empty
listen_ipv6=NO
local_umask=022
pasv_enable=YES
pasv_address=127.0.0.1
pasv_min_port=30000
pasv_max_port=30049
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
local_root=/var/www/html
userlist_enable=YES
userlist_deny=NO
userlist_file=/etc/vsftpd.user_list
EOF

service vsftpd stop

/usr/sbin/vsftpd /etc/vsftpd.conf