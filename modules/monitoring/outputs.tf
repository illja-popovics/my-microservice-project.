output "grafana_admin_password" {
  description = "Grafana admin password"
  value       = "Use kubectl to get admin password: kubectl get secret -n monitoring prometheus-grafana -o jsonpath='{.data.admin-password}' | base64 --decode"
}
