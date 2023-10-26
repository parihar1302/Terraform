#!/bin/bash

# Using s3 bucket "cwagents3toec2" to upload config.json file onto ec2 instance

# Detect the instance architecture
if [ "$(uname -m)" = "x86_64" ]; then
  # Commands for x86_64 instances
  echo "This is an x86_64 instance."
  
  # Install the CloudWatch Agent for x86_64
  sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
  sudo rpm -U ./amazon-cloudwatch-agent.rpm
else
  # Commands for arm64 instances
  echo "This is an arm64 instance."
  
  # Install the CloudWatch Agent for arm64
  sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/arm64/latest/amazon-cloudwatch-agent.rpm
  sudo rpm -U ./amazon-cloudwatch-agent.rpm
fi


# Upload CWAgent JSON (config.json) customized configuration file from S3 bucket to newly provisioned ec2 instance
sudo aws s3 cp s3://cwagents3toec2/config.json /opt/aws/amazon-cloudwatch-agent/bin/config.json

# Restart the CloudWatch Agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s

# Enable the agent to auto-start on system boot
sudo systemctl enable amazon-cloudwatch-agent

# CWagent status verify command
# sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status