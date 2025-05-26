#!/bin/bash




/usr/sbin/vsftpd /etc/vsftpd.conf



#same
# listen=YES
# anonymous_enable=NO

# local_enable=YES
# xferlog_enable=YES
# secure_chroot_dir=/var/run/vsftpd/empty
# listen_ipv6=NO

#comment

# write_enable=YES
# local_umask=022
# chroot_local_user=YES        x2

#no

# pasv_enable=YES
# pasv_address=${INCEPTION_IP} #localhost
# pasv_min_port=30000 #40000
# pasv_max_port=30009 #40005
# local_root=/home/${INCEPTION_FTP_USER} #local_root=/var/www ${FTP_USER}
# allow_writeable_chroot=YES
# userlist_file=/etc/vsftpd.userlist
