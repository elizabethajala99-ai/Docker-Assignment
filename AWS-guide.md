# AWS Setup Guide - Simple Steps

## Step 1: Create IAM Role
1. AWS Console → **IAM** → **Roles** → **Create role**
2. Select **AWS service** → **EC2** → **Next**
3. Add policies:
   - `CloudWatchAgentServerPolicy`
   - `CloudWatchLogsFullAccess`
4. Role name: `CloudboostaRole`
5. **Create role**

## Step 2: Launch EC2 Instance
1. AWS Console → **EC2** → **Launch instance**
2. **Name**: `Cloudboosta-WordPress`
3. **OS**: Ubuntu Server 24.04 LTS
4. **Instance type**: t3.medium

5. **Key pair**: Create new → `cloudboosta-key` → Download .pem file
6. **Security group**: 
   - SSH (22) - My IP
   - HTTP (80) - 0.0.0.0/0
   - HTTPS (443) - 0.0.0.0/0
   - Custom TCP (8080) - 0.0.0.0/0
7. **IAM instance profile**: `CloudboostaRole`
8. **User data**: Copy the content from `ec2-user-data.sh` and update YOUR_GITHUB_USERNAME and YOUR_REPO_NAME with your actual GitHub details
9. **Launch instance**

## Step 3: Wait for Deployment
⚠️ **IMPORTANT**: After launching the EC2 instance, **wait 5-10 minutes** for the automated deployment to complete before accessing the website. The user-data script needs time to:
- Install Docker
- Clone the GitHub repository  
- Start the containers
- Initialize WordPress and MySQL

## Step 4: CloudWatch Setup
1. AWS Console → **CloudWatch** → **Log groups**
2. **Create log group**: `cloudboosta-logs`
3. **Retention**: 7 days

## Step 5: Access Site
1. Push your project to GitHub (make it public)
2. Update the GitHub repo URL in the user data script
3. EC2 → Instances → Get **Public IP**
4. **⏳ Wait 5-10 minutes** for full deployment to complete
5. Visit: `http://PUBLIC_IP:8080`
6. **Setup WordPress** using credentials from `.env` file:
   - **Database Name**: `cloudboosta_db`
   - **Username**: `admin` 
   - **Password**: (from `WORDPRESS_DB_PASSWORD` in .env)
   - **Database Host**: `mysql`
7. **Create WordPress Admin Account**:
   - **Username**: (from `WORDPRESS_ADMIN_USER` in .env)
   - **Password**: (from `WORDPRESS_ADMIN_PASSWORD` in .env)  
   - **Email**: (from `WORDPRESS_ADMIN_EMAIL` in .env)
8. **Activate Theme**: Go to Appearance → Themes → Activate **"Cloudboosta Corporate"**

## SSH Access
```bash
chmod 400 cloudboosta-key.pem
ssh -i cloudboosta-key.pem ubuntu@PUBLIC_IP
```

Done!