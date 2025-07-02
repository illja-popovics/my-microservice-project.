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
  eks_role_arn = module.iam.eks_role_arn

}

module "ecr" {
  source            = "./modules/ecr"
  django_repo_name  = "django-app"
}

module "s3_backend" {
  source = "./modules/s3-backend"
}

module "rds" {
  source             = "./modules/rds"
  subnet_group_name  = module.vpc.db_subnet_group_name
  security_group_id  = module.vpc.rds_sg_id
}

module "iam" {
  source     = "./modules/iam"
  role_name  = "lesson7-eks-cluster-role"
}
