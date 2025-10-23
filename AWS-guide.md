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

## Step 3: CloudWatch Setup
1. AWS Console → **CloudWatch** → **Log groups**
2. **Create log group**: `cloudboosta-logs`
3. **Retention**: 7 days

## Step 4: Access Site
1. Push your project to GitHub (make it public)
2. Update the GitHub repo URL in the user data script
3. EC2 → Instances → Get **Public IP**
4. Visit: `http://PUBLIC_IP:8080`
5. Complete WordPress setup

## SSH Access
```bash
chmod 400 cloudboosta-key.pem
ssh -i cloudboosta-key.pem ubuntu@PUBLIC_IP
```

Done!