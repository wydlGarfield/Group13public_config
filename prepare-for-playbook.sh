sudo apt update
sudo apt upgrade
sudo apt -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update
sudo apt -y install ansible
sudo apt -y install python-pip
pip install botocore boto boto3
mkdir -pv ~/.aws/

#set aws asscess key and aws secret access key
echo "[default]
aws_access_key_id = $1
aws_secret_access_key = $2" > ~/.aws/credentials

#set region
echo "[default]
region = $3" > ~/.aws/config


echo -e "[local]
localhost \n
[webserver]" > ~/hosts

# Create playbook config file
cd ~
sudo wget -c https://raw.githubusercontent.com/wydlGarfield/Group13public_config/master/ansible.cfg
