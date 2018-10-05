#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y

sudo apt update
#sudo apt -y install ansible
sudo apt -y install python-pip
pip install botocore boto boto3

pip install virtualenv ansible2.6
source ansible2.1/bin/activate
pip install ansible==2.6.5
pip install redis

mkdir -pv ~/.aws/


#set aws asscess key and aws secret access key

read -p "Your AWS_Access_Key_ID is:" aaki
read -p "Your AWS_Secret_Access_Key is:" asak
read -p "Your Region(eg.us-west-2) is:" region

echo "[default]
aws_access_key_id = $aaki
aws_secret_access_key = $asak" > ~/.aws/credentials
sudo chmod 666 ~/.aws/credentials


#set region
echo "[default]
region = $region" > ~/.aws/config
sudo chmod 666 ~/.aws/config


# Create hosts file
echo -e "[local]
localhost\n
[database]\n
[web_server]\n
[nginx]" > ~/hosts
sudo chmod 666 ~/hosts


# Create playbook config file
cd ~
sudo wget -c https://raw.githubusercontent.com/wydlGarfield/Group13public_config/master/ansible.cfg
#sudo apt install awscli -y
