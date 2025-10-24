# Cloudboosta WordPress Deployment

Docker Compose setup for containerizing the **Cloudboosta website** with both local development and AWS cloud deployment options.

## 🚀 Quick Start

### Local Development
```bash
# 1. Clone repository
git clone <your-repo-url>
cd Docker-Assignment

# 2. Setup environment
cp .env.example .env
# Edit .env with your preferred passwords

# 3. Deploy containers
docker-compose up -d

# 4. Setup WordPress
./setup-site.sh

# 5. Access site
open http://localhost:8080
```

### AWS Cloud Deployment
```bash
# Follow AWS-guide.md for complete instructions
# Uses ec2-user-data.sh for automated EC2 setup
```

## 📁 Project Structure
```
Docker-Assignment/
├── docker-compose.yml          # Container orchestration (uses .env)
├── .env.example               # Environment template
├── setup-site.sh              # Local WordPress setup script
├── ec2-user-data.sh           # AWS EC2 automated deployment
├── AWS-guide.md               # AWS deployment instructions
├── README.md                  # This documentation
└── wordpress-site/            # Custom Cloudboosta theme
    └── wp-content/themes/cloudboosta/
        ├── style.css          # Theme styles
        ├── index.php          # Theme template
        └── functions.php      # WordPress functions
```

## 🌩️ Services

### Local Development Stack
- **WordPress** (port 8080) - Cloudboosta website
- **MySQL 8.0** - Database backend

### AWS Cloud Stack  
- **EC2 Instance** - Ubuntu 24.04 LTS, t3.medium
- **CloudWatch** - Monitoring and logging
- **IAM Role** - Secure AWS service access
- **Docker Containers** - Same as local development

## ⚙️ Configuration

### Environment Variables (.env)
All configuration is managed through environment variables:
- Database credentials
- WordPress admin settings
- Container versions
- Port mappings

### Security
- Passwords stored in .env (not in repository)
- .env.example provides template without sensitive data
- AWS IAM roles for secure cloud access

## ✅ Local Deployment Steps

1. **Setup Environment**
   ```bash
   cp .env.example .env
   # Edit .env with your passwords
   ```

2. **Start Containers**
   ```bash
   docker-compose up -d
   ```

3. **Configure WordPress** 
   ```bash
   ./setup-site.sh
   ```

4. **Access Application**
   - Website: http://localhost:8080
   - Admin: http://localhost:8080/wp-admin

5. **Setup WordPress & Activate Theme**
   - Visit http://localhost:8080
   - Complete WordPress installation using credentials from your `.env` file:
     - **Database Name**: `cloudboosta_db`
     - **Username**: `admin`
     - **Password**: (use `WORDPRESS_DB_PASSWORD` from .env)
     - **Database Host**: `mysql`
   - Create WordPress admin account using:
     - **Username**: (use `WORDPRESS_ADMIN_USER` from .env)
     - **Password**: (use `WORDPRESS_ADMIN_PASSWORD` from .env)
     - **Email**: (use `WORDPRESS_ADMIN_EMAIL` from .env)
   - Go to Appearance → Themes
   - Activate **"Cloudboosta Corporate"** theme

## ☁️ AWS Cloud Deployment

See [AWS-guide.md](AWS-guide.md) for complete cloud deployment instructions including:
- IAM role setup
- EC2 instance configuration  
- CloudWatch monitoring
- Security group rules

## 🛑 Stop Services
```bash
docker-compose down
```

## 🔧 Verify Deployment
```bash
# Check running containers
docker-compose ps

# View logs
docker-compose logs

# Test website response
curl -I http://localhost:8080
```

## 🎯 Assignment Demonstration

This project demonstrates how containerization solves key DevOps challenges:

- **✅ Environment Consistency:** Identical containers across development and production
- **✅ OS Compatibility:** Eliminates operating system compatibility concerns  
- **✅ Seamless Collaboration:** All developers work with identical containerized environment
- **✅ Cloud Deployment:** Professional AWS infrastructure with monitoring
- **✅ Security Best Practices:** Environment variables, IAM roles, CloudWatch logging

## 📊 Monitoring & Logging

### Local Development
- Container logs via `docker-compose logs`
- WordPress debug logging

### AWS Production  
- CloudWatch metrics and dashboards
- Application logs in CloudWatch Log Groups
- EC2 instance monitoring
- Real-time alerts and notifications

## 🚀 Technology Stack

- **Containerization:** Docker & Docker Compose
- **Web Server:** WordPress 6.3+ with PHP 8.2
- **Database:** MySQL 8.0
- **Cloud Platform:** AWS (EC2, CloudWatch, IAM)
- **Operating System:** Ubuntu 24.04 LTS

---
