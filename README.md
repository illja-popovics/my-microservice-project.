
# 🛠️ my-microservice-project

Infrastructure as Code for deploying a production-ready microservice app on AWS using Terraform, EKS, Jenkins, Argo CD, ECR, RDS, and more.

---

## 📦 Project Structure

```
.
├── main.tf                 # Root Terraform module
├── backend.tf              # Remote state config (S3 + DynamoDB)
├── outputs.tf              # Global outputs
├── terraform.tfvars        # Custom values
├── modules/
│   ├── vpc/                # VPC, subnets, routing, security
│   ├── eks/                # EKS cluster and node group
│   ├── ecr/                # ECR repo for Docker images
│   ├── jenkins/            # Jenkins via Helm
│   ├── argo_cd/            # Argo CD via Helm
│   ├── s3-backend/         # Remote state setup
│   └── rds/                # ✅ PostgreSQL or Aurora DB
└── charts/
    └── django-app/         # Helm chart for Django app
```

---

## 🚀 Deploy Infrastructure

1. **Configure Terraform backend (optional)**
   ```bash
   terraform init
   ```

2. **Plan and apply infrastructure**
   ```bash
   terraform plan
   terraform apply
   ```

3. **After deployment, outputs will include:**
   - EKS cluster endpoint
   - Argo CD endpoint
   - Jenkins access info
   - RDS endpoint

---

## ✅ RDS Module

This module supports:
- Regular PostgreSQL or MySQL instance
- Aurora cluster (PostgreSQL-compatible)

### 🔧 Usage

```hcl
module "rds" {
  source             = "./modules/rds"
  use_aurora         = true        # or false
  subnet_group_name  = module.vpc.db_subnet_group_name
  security_group_id  = module.vpc.rds_sg_id
  ...
}
```

It automatically provisions:
- Subnet Group
- Security Group
- Parameter Group with:
  - `max_connections`
  - `log_statement`
  - `work_mem`

---

## 🔧 Check Jenkins Job

1. Access Jenkins:
   ```bash
   kubectl port-forward svc/jenkins -n jenkins 8080:8080
   open http://localhost:8080
   ```

2. Login with credentials from Terraform output or your `values.yaml`.

3. Run and monitor jobs under “Build History”.

---

## 🚀 View Argo CD Applications

1. Access Argo CD:
   ```bash
   kubectl port-forward svc/argocd-server -n argocd 8080:443
   open https://localhost:8080
   ```

2. Login:
   - Username: `admin`
   - Password: use this to retrieve it:
     ```bash
     kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
     ```

3. Review deployments and sync your apps.

---

## 🧹 Destroy Infrastructure

```bash
terraform destroy
```
