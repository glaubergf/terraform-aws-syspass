#!/bin/bash
sudo hostnamectl set-hostname tf-syspass-server
echo 'admin:123syspass' | sudo chpasswd
sudo apt-get update
sudo mv /etc/motd /etc/motd-ORIG
sudo mv /etc/ssh/sshd_config /etc/ssh/sshd_config-ORIG
sudo cp /tmp/sshd_config /etc/ssh/sshd_config
sudo service ssh restart
sudo service sshd restart