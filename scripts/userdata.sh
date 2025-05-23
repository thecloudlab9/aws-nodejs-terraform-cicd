#!/bin/bash
# Install Node.js 18 on Amazon Linux 2023
dnf module enable nodejs:18 -y
dnf install -y nodejs git

# Clone and launch app
cd /home/ec2-user
git clone https://github.com/<your-username>/aws-nodejs-terraform-cicd.git
cd aws-nodejs-terraform-cicd/app
npm install
nohup node server.js > /home/ec2-user/output.log 2>&1 &