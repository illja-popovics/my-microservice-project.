provider "aws" {
  region = "eu-north-1"
}

module "vpc" {
  source       = "./modules/vpc"
  project_name = "lesson7"
}

module "eks" {
  source              = "./modules/eks"
  cluster_name        = "lesson7-cluster"
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.vpc.public_subnet_ids
  eks_role_arn        = "arn:aws:iam::146554952179:role/lesson7-eks-cluster-role"
  node_group_role_arn = "arn:aws:iam::146554952179:role/lesson7-nodegroup-role"
}

module "ecr" {
  source           = "./modules/ecr"
  django_repo_name = "django-app"
}

module "s3_backend" {
  source = "./modules/s3-backend"
}

module "rds" {
  source             = "./modules/rds"
  subnet_group_name  = module.vpc.db_subnet_group_name
  security_group_id  = module.vpc.rds_sg_id
}

# AUTH для доступу до кластеру
data "aws_eks_cluster_auth" "auth" {
  name = module.eks.cluster_name
}

# Kubernetes Provider
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.auth.token
  cluster_ca_certificate = base64decode(module.eks.cluster_ca_certificate)
}

# Helm Provider
provider "helm" {
  kubernetes = {
    host                   = module.eks.cluster_endpoint
    token                  = data.aws_eks_cluster_auth.auth.token
    cluster_ca_certificate = base64decode(module.eks.cluster_ca_certificate)
  }
}

module "argo_cd" {
  source         = "./modules/argo_cd"
  namespace      = "argocd"
  chart_version  = "5.46.5"

  kube_host      = module.eks.cluster_endpoint
  kube_ca_cert   = module.eks.cluster_ca_certificate
  kube_token     = data.aws_eks_cluster_auth.auth.token
}

module "jenkins" {
  source              = "./modules/jenkins"
  namespace           = "jenkins"
  chart_version       = "5.8.66"
  cluster_name        = module.eks.cluster_name
  cluster_ca          = module.eks.cluster_ca_certificate
  cluster_endpoint    = module.eks.cluster_endpoint
  token               = data.aws_eks_cluster_auth.auth.token
  jenkins_values_file = file("${path.module}/modules/jenkins/values.yaml")
}
