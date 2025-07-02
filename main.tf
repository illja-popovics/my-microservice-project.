provider "aws" {
  region = "eu-north-1"
}

module "vpc" {
  source       = "./modules/vpc"
  project_name = "lesson7"
}

module "eks" {
  source        = "./modules/eks"
  cluster_name  = "lesson7-cluster"
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.public_subnet_ids
    eks_role_arn = module.eks.eks_role_arn

}

module "ecr" {
  source            = "./modules/ecr"
  django_repo_name  = "django-app"
}

