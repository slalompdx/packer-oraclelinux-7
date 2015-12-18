#!/bin/sh

yum -y install oracle-rdbms-server-12cR1-preinstall xauth ruby
gem install pleaserun
touch /home/vagrant/.Xauthority
chown vagrant /home/vagrant/.Xauthority
echo "*     soft   nofile  1024" >> /etc/security/limits.conf
echo "*     hard   nofile  65536" >> /etc/security/limits.conf
echo "session required /lib/security/pam_limits.so" >> /etc/pam.d/login
echo 65536 > /proc/sys/fs/file-max
dd if=/dev/zero of=/swapfile bs=1024 count=6500536
mkswap /swapfile
swapon /swapfile
echo "/swapfile          swap            swap    defaults        0 0" >> /etc/fstab
reboot
sleep 60
