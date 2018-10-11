
# Wordpress Install with Ansible and Nginx

run prepare.sh with `sudo bash prepare.sh`

and set_up.yml with 

`ansible-playbook -i ./hosts set_up.yml`

It will create 5 instances on AWS

one for database
one for Nginx
three for wordpress

Just input the Nginx server public ip address into web browser and it will display different wordpress server each time.

## If you want to run the playbook more than once, please delete the new_key.pem in the keypair.






























### Group13public_config
upload config files to public repository

useful command:
ls
cd
cat
vim

sudo bash xx.sh  <br>
ansible-playbook -i ./hosts xx.yml

ssh -i ~/.ssh/key_name.pem ubuntu@public_IPV4 <br>
root: sudo su

https://docs.google.com/document/d/1Ietlce0GaPBwWfa7-DvtChq2VynfriGu7K-hwAQgBcc/edit

https://docs.google.com/document/d/1q6E70c3p4PORAt1f5L6_m_0-9NOizocWAM1oC3sj4TI/edit
