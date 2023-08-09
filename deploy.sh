#!/bin/bash

EC2_INSTANCE_IP="$1"
EC2_SSH_PRIVATE_KEY="$2"

echo "Deploying Hello World app to EC2 instance..."

# Save the PEM key to a file
echo "$EC2_SSH_PRIVATE_KEY" > key.pem
chmod 400 key.pem

# Copy files and run commands on the remote EC2 instance
scp -i key.pem app.py ubuntu@"$EC2_INSTANCE_IP":/home/ubuntu/
ssh -i key.pem ubuntu@"$EC2_INSTANCE_IP" "python3 /home/ubuntu/app.py"

# Clean up the PEM key file
rm key.pem

echo "Deployment completed."
