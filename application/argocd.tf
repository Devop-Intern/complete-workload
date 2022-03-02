################################################################################
# ArgoCD Engine
################################################################################
resource "helm_release" "argocd-helm" {
  name = "argocd-helm"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  create_namespace = true
  namespace        = "argocd"
}
