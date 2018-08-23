#!/bin/bash

sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -"\n"

sudo apt-get update
sudo apt-get install ansible -y

sudo apt-get install python-pip -y

pip install botocore boto boto3
pip install --upgrade pip

apt install awscli -y
aws configure

echo "[local]
localhost
[webserver]" > ~/hosts

# Create playbook config file
cd ~
sudo wget -c https://raw.githubusercontent.com/shiclaire/a1/master/ansible.cfg
