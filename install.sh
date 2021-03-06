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

yum remove firewalld

yum -y install ruby unzip httpd-tools puppet bind augeas

sh <(curl -s https://install.openshift.com/)


