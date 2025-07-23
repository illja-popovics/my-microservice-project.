variable "namespace" {
  description = "Namespace to deploy Prometheus and Grafana"
  type        = string
  default     = "monitoring"
}

variable "chart_version" {
  description = "Helm chart version for kube-prometheus-stack"
  type        = string
  default     = "56.6.0" # check for the latest compatible version
}
