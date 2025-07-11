output "jenkins_url" {
  value       = "http://jenkins.${var.namespace}.svc.cluster.local:8080"
  description = "Internal Jenkins URL"
}

output "jenkins_admin_password" {
  value       = helm_release.jenkins.metadata.name
  description = "Jenkins admin password (stored in k8s secret)"
}
