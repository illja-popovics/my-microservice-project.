resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  # Логи вимикаємо — економимо
  enabled_cluster_log_types = []
}

resource "aws_eks_node_group" "default" {
  cluster_name     = aws_eks_cluster.this.name
  node_group_name  = "default-node-group"
  node_role_arn    = var.node_group_role_arn
  subnet_ids       = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t3.micro"]
  ami_type       = "AL2023_x86_64_STANDARD" 

  capacity_type  = "ON_DEMAND"
}
