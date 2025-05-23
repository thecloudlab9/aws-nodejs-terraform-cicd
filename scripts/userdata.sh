#!/bin/bash
sudo yum update -y
sudo yum install -y nodejs npm git
cd /home/ec2-user
git clone https://github.com/<your-username>/aws-nodejs-terraform-cicd.git
cd aws-nodejs-terraform-cicd/app
npm install
nohup node server.js > output.log 2>&1 &