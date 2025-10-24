#!/bin/bash

# Cloudboosta WordPress - GitHub-Based EC2 Deployment
# This script clones your GitHub repo and runs docker compose from there

# Enable logging
exec > >(tee /var/log/user-data.log) 2>&1
echo "🚀 Starting Cloudboosta deployment at $(date)"

# Update system and install required packages
echo "📦 Installing required packages..."
sudo apt update -y
sudo apt install -y git curl

# Install Docker using official script only
echo "🐳 Installing Docker CE..."
export DEBIAN_FRONTEND=noninteractive
curl -fsSL https://get.docker.com | sudo sh

# Ensure Docker service is properly started
echo "🔧 Starting Docker service..."
sudo systemctl stop docker || true
sudo systemctl start docker
sudo systemctl enable docker

# Add ubuntu user to docker group
echo "👤 Adding ubuntu user to docker group..."
sudo usermod -aG docker ubuntu

# Wait for Docker to be fully ready
echo "⏳ Waiting for Docker to be ready..."
sleep 10

# Verify Docker is running properly
echo "🔍 Verifying Docker installation..."
sudo docker --version
sudo systemctl is-active docker
sudo docker info

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

# Ensure proper permissions
sudo chown -R ubuntu:ubuntu "/home/ubuntu/$DEPLOY_DIR"

# Start Docker containers
echo "🐳 Starting Docker containers..."
# Use sudo -u ubuntu to run as ubuntu user (who is now in docker group)
sudo -u ubuntu docker compose pull
sudo -u ubuntu docker compose up -d

# Wait for containers to initialize
echo "⏳ Waiting for containers to initialize..."
sleep 15

# Check if containers started successfully
echo "🔍 Checking container status..."
sudo -u ubuntu docker compose ps

# More robust WordPress accessibility check
echo "🌐 Testing WordPress accessibility..."
for i in {1..24}; do
    if curl -f -s http://localhost:8080 > /dev/null; then
        echo "✅ WordPress is responding!"
        break
    else
        echo "⏳ Waiting for WordPress to start... (attempt $i/24)"
        sleep 15
    fi
done

# Final verification
echo "📊 Final container status:"
sudo -u ubuntu docker compose ps
sudo -u ubuntu docker compose logs --tail=10

# Get public IP and log completion
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4 2>/dev/null || echo "localhost")
echo "🎉 Cloudboosta WordPress deployed at: http://${PUBLIC_IP}:8080"

# Log deployment details
echo "$(date): GitHub deployment completed" | sudo tee -a /var/log/cloudboosta-deployment.log
echo "Repository: $GITHUB_REPO" | sudo tee -a /var/log/cloudboosta-deployment.log
echo "Public IP: $PUBLIC_IP" | sudo tee -a /var/log/cloudboosta-deployment.log

# Show final status
echo "📊 Final container status:"
sudo -u ubuntu docker compose ps