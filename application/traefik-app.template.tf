# resource "kubectl_manifest" "..." {
#   depends_on = [helm_release.argocd-helm]
#   yaml_body = <<YAML
# apiVersion: argoproj.io/v1alpha1
# kind: Application
# metadata:
#   name: ...
#   namespace: argocd
# spec:
#   project: default
#   source:
#     repoURL: "https://github.com/Devop-Intern/helm-template.git"
#     path: helm/traefik
#     targetRevision: HEAD
#     helm:
#       values: |-
#         echoserver:
#           name: ...
#           image: ealen/echo-server:latest
#           replicas: 1
#           containerPort: 80
#           serviceType: ClusterIP
#           servicePort: 80
#           path: /traefikecho
#           pathType: Exact
#         helloserver:
#           name: ...
#           image: tutum/hello-world:latest
#           replicas: 1
#           containerPort: 80
#           serviceType: ClusterIP
#           servicePort: 80
#           path: /traefikhello
#           pathType: Exact
#         pgadmin:
#           name: ...
#           image: dpage/pgadmin4
#           replicas: 1
#           containerPort: 80
#           serviceType: ClusterIP
#           servicePort: 80
#           path: /traefikpgadmin
#           pathType: Prefix
#           email: patiphan.t@appman.co.th
#           password: admin
#           scriptname: /traefikpgadmin
#         ingress:
#           name: ...
#           pgadmin_name: ...
#           host: ...
#         ingressctl:
#           name: traefik-ingress-controller
#           nodename: ...
#           namespaceapp: argocd
#           namespacedest: traefik
#           project: default
#           chart: traefik
#           repo: https://helm.traefik.io/traefik
#           targetrevision: 10.15.0
#           server: https://kubernetes.default.svc
#         nodeport:
#           name: traefik
#           namespace: traefik
#           type: NodePort
#           porthttp: 80
#           porthttps: 443
#           tghttp: 8000
#           tghttps: 8443
#           protocal: TCP
#           nodeport: ...
#           http: http
#           https: https
#           app: traefik
#   destination:
#     server: "https://kubernetes.default.svc"
#     namespace: traefik-workload
#   syncPolicy:
#     automated:
#       prune: true
#       selfHeal: true
#     syncOptions:
#       - CreateNamespace=true
# YAML
# }