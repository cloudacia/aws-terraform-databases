#!/bin/bash
sudo yum update -y
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl start amazon-ssm-agent
sudo yum install mysql -y
sudo yum install git -y
sudo yum install nc -y
git clone https://github.com/datacharmer/test_db.git
