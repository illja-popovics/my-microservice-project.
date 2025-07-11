variable "namespace" {
  description = "Namespace for Argo CD"
  type        = string
  default     = "argocd"
}

variable "chart_version" {
  description = "Helm chart version for Argo CD"
  type        = string
  default     = "5.46.5"
}

variable "kube_host" {
  description = "Kubernetes cluster host"
  type        = string
}

variable "kube_ca_cert" {
  description = "Kubernetes cluster CA certificate (base64 encoded)"
  type        = string
}

variable "kube_token" {
  description = "Kubernetes auth token"
  type        = string
}

