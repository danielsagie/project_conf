
resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "3.35.4"
  values           = [file("values/argo-cd.yaml")]
}

resource "kubernetes_namespace" "myapp" {
  metadata {
    name = var.namespace_myapp
  }
}
