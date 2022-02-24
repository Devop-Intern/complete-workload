resource "kubectl_manifest" "ingress" {
  depends_on = [helm_release.argocd-helm]
  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: nginx-ingress
  namespace: argocd
spec:
  project: default
  source:
    chart: nginx-ingress
    repoURL: https://helm.nginx.com/stable
    targetRevision: 0.4.1
    helm:
      values: |-
        controller:
          service:
            create: false
  destination:
    server: https://kubernetes.default.svc
    namespace: nginx-ingress
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
YAML
}