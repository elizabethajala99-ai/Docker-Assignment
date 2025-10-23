#!/bin/bash

# Cloudboosta WordPress - GitHub-Based EC2 Deployment
# This script clones your GitHub repo and runs docker compose from there

# Update system and install required packages
sudo apt update -y
sudo apt install -y git docker.io curl

# Install Docker Compose v2
curl -fsSL https://get.docker.com | sudo sh

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Clone your GitHub repository
cd /home/ubuntu
GITHUB_REPO="https://github.com/elizabethajala99-ai/Docker-Assignment.git" # Replace with your repo URL
DEPLOY_DIR="cloudboosta-app"

echo "🚀 Cloning repository from GitHub..."
if [ ! -d "$DEPLOY_DIR" ]; then
    sudo -u ubuntu git clone "$GITHUB_REPO" "$DEPLOY_DIR"
else
    cd "$DEPLOY_DIR"
    sudo -u ubuntu git pull origin main
fi

# Navigate to the cloned repository
cd "/home/ubuntu/$DEPLOY_DIR"

# Create .env file from .env.example if needed
if [ -f ".env.example" ] && [ ! -f ".env" ]; then
    sudo -u ubuntu cp .env.example .env
fi

# Ensure proper permissions
sudo chown -R ubuntu:ubuntu "/home/ubuntu/$DEPLOY_DIR"

# Start Docker containers
echo "🐳 Starting Docker containers..."
sudo -u ubuntu docker compose pull
sudo -u ubuntu docker compose up -d

# Wait for containers to be ready
sleep 30

# Get public IP and log completion
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4 2>/dev/null || echo "localhost")
echo "🎉 Cloudboosta WordPress deployed at: http://${PUBLIC_IP}:8080"
echo "$(date): GitHub deployment completed" | sudo tee -a /var/log/cloudboosta-deployment.log