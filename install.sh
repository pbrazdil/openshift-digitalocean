#!/bin/sh -e

set -e

if [ $(getenforce) != "Enforcing" ]; then
  echo -e "SELINUX=enforcing\nSELINUXTYPE=targeted" > /etc/sysconfig/selinux
  echo "Selinux conf changed, rebooting machine in 5 sec ..."
  sleep 6
  reboot
else
  echo "Selinux is OK"
fi

yum -y install ruby unzip httpd-tools puppet bind augeas

sh <(curl -s http://oo-install.rhcloud.com) -d

