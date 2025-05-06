# # AWS EKS Deployment using Terraform and GitHub Actions 🚀

This project provisions a highly available **Amazon EKS Cluster**, **VPC**, **IAM Roles**, and supporting infrastructure using **Terraform** and manages the deployment lifecycle through **GitHub Actions CI/CD pipelines**.

---

## 📚 Architecture Overview

- **Terraform** for Infrastructure as Code (IaC)
- **AWS S3** bucket for Terraform remote backend
- **AWS DynamoDB** table for state locking
- **Amazon VPC** with public and private subnets across AZs
- **Amazon EKS Cluster** with managed node groups
- **IAM Roles** for EKS cluster and nodes
- **GitHub Actions** for automated Terraform Plan/Apply

<p align="center">
  <img src="https://user-images.githubusercontent.com/your-architecture-diagram.png" alt="EKS Architecture" width="700"/>
</p>

---

## 📂 Project Structure

```bash
eks-terraform-deployment/
├── backend/                 # Terraform code for backend (S3 + DynamoDB)
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
├── modules/                 # Reusable Terraform modules
│   ├── vpc/
│   ├── iam/
│   ├── eks/
├── environments/
│   └── dev/                 # Development environment
│       ├── main.tf
│       ├── providers.tf
│       ├── backend.tf
│       ├── variables.tf
├── .github/
│   └── workflows/
│       └── terraform-cicd.yml  # GitHub Actions Workflow
├── .gitignore
├── README.md
🛠 Prerequisites
Terraform v1.2+

AWS CLI configured locally

AWS IAM User with proper permissions (S3, DynamoDB, EKS, VPC, IAM)

GitHub repository with these secrets:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

kubectl installed (for accessing EKS)

🚀 Usage
1️⃣ Deploy the Backend (S3 + DynamoDB)
bash
Copy
Edit
cd backend/
terraform init
terraform apply -auto-approve
Creates:

S3 Bucket for Terraform state

DynamoDB table for state locking

2️⃣ Deploy the Infrastructure
bash
Copy
Edit
cd environments/dev/
terraform init
terraform apply -auto-approve
Creates:

VPC, Subnets, Route Tables

Internet Gateway, NAT Gateway

IAM Roles for EKS Cluster and Worker Nodes

EKS Cluster and Node Group

⚙️ CI/CD with GitHub Actions
✅ Whenever you push to main branch,
GitHub Action will:

Deploy backend first (backend/)

Deploy infrastructure (environments/dev/)

GitHub Actions Workflow File: .github/workflows/terraform-cicd.yml

Features:

terraform init, plan, apply

Backend created before environment

AWS credentials securely loaded from GitHub Secrets

Automatic deployment 🚀

🧹 Destroying the Infrastructure
Important: You must destroy in the right order!

1️⃣ Destroy Infrastructure
bash
Copy
Edit
cd environments/dev/
terraform destroy -auto-approve
2️⃣ Destroy Backend
bash
Copy
Edit
cd ../../backend/
terraform destroy -auto-approve
✅ This ensures proper cleanup of AWS resources!

Warning: Never destroy the backend first, or you will lose the remote state file and orphan AWS resources.

📋 Important Notes
State Management: State is stored in S3 with locking enabled via DynamoDB.

Encryption: S3 buckets are encrypted with AES-256.

Unique Bucket Name: Bucket names are globally unique, ensure your name is not already taken.

Force Destroy: force_destroy = true is enabled for backend S3 bucket (to allow clean bucket deletion).

📈 Best Practices Implemented
Separate backend from infrastructure

Modularized Terraform code (VPC, IAM, EKS modules)

Use of GitHub Actions for full CI/CD automation

Remote state with locking

Dynamic AZ selection

Least privilege IAM policies

Proper .gitignore to prevent leaking sensitive files


🙌 Author
Built with ❤️ by Prameshwar Thapa.

