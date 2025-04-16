🚀 Terraform AWS VPC + ALB Project
This project demonstrates how to use Terraform to provision a fully functional VPC with subnets, route tables, internet gateway, and an Application Load Balancer (ALB) in AWS.

✅ Features
🔧 Modular Terraform setup for clean and reusable code

🌐 Custom VPC with public and private subnets across multiple Availability Zones

🚪 Internet Gateway & Route Tables for public access configuration

⚖️ Application Load Balancer (ALB) deployed in public subnets

🔐 Security Groups for ALB and EC2 instances

☁️ EC2 instances behind the ALB for a basic web tier

📁 Project Structure

terraform-vpc-alb/
├── main.tf           # Root module entry
├── vpc/              # VPC module (VPC, subnets, route tables, IGW)
├── alb/              # ALB module (Load Balancer, target groups, listeners)
├── outputs.tf        # Output values
├── variables.tf      # Variable declarations
└── terraform.tfvars  # Custom input variables

💡 What You’ll Learn
How to structure Terraform projects using modules

How to provision AWS infrastructure with best practices

How to build a scalable VPC network architecture

How to deploy an ALB and connect it to EC2 instances

📌 Prerequisites
AWS account with IAM credentials

Terraform installed locally (v1.x+)

AWS CLI configured

🧪 How to Use

git clone https://github.com/mahmoud20H/terraform-vpc-alb.git
cd terraform-vpc-alb

terraform init
terraform plan
terraform apply
