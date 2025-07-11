variable "namespace" {
  description = "The Kubernetes namespace where Jenkins will be installed"
  type        = string
}

variable "chart_version" {
  description = "The version of the Jenkins Helm chart"
  type        = string
  default = "5.8.67"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_ca" {
  description = "The base64 encoded certificate authority data for the EKS cluster"
  type        = string
}

variable "cluster_endpoint" {
  description = "The endpoint URL of the EKS cluster"
  type        = string
}

variable "token" {
  description = "The authentication token for accessing the EKS cluster"
  type        = string
}

variable "jenkins_values_file" {
  description = "The path to the Jenkins Helm values file"
  type        = string
}

variable "admin_user" {
  description = "Admin username for Jenkins"
  type        = string
  default     = "admin"
}

variable "admin_password" {
  description = "Admin password for Jenkins"
  type        = string
  default     = "admin123"
}
