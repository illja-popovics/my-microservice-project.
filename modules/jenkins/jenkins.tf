 resource "kubernetes_namespace" "jenkins" {
  metadata { name = var.namespace }
}

resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = var.chart_version
  namespace  = var.namespace


  depends_on = [kubernetes_namespace.jenkins]
  values = [file("${path.module}/values.yaml")]

  set = [
  {
    name  = "controller.admin.username"
    value = var.admin_user
  },
  {
    name  = "controller.admin.password"
    value = var.admin_password
  },
  {
    name  = "controller.persistence.enabled"
    value = "false"
  },
  {
    name  = "controller.persistence.existingClaim"
    value = ""
  },
  {
    name  = "persistence.enabled"
    value = "false"
    },
  {
    name  = "controller.persistence.storageClass"
    value = ""
  }
]

}
