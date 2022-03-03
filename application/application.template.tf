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
#     path: helm
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
#           path: /echo
#           pathType: Exact
#         helloworld:
#           name: ...
#           image: tutum/hello-world:latest
#           replicas: 1
#           containerPort: 80
#           serviceType: ClusterIP
#           servicePort: 80
#           path: /hello
#           pathType: Exact
#         pgadmin:
#           name: ...
#           image: dpage/pgadmin4
#           replicas: 1
#           containerPort: 80
#           serviceType: ClusterIP
#           servicePort: 80
#           path: /pgadmin
#           pathType: Prefix
#           email: ...
#           password: ...
#           scriptname: /pgadmin
#         ingress:
#           name: ...
#           host: ...
#           annotations:
#             kubernetes.io/ingress.class: nginx
#             nginx.org/rewrites: "serviceName=... rewrite=/pgadmin"
#             nginx.org/rewrites: "serviceName=... rewrite=/"
#             nginx.org/rewrites: "serviceName=... rewrite=/"
#         nodeport:
#           name: ...
#           namespace: nginx-ingress
#           type: NodePort
#           port1: 80
#           port2: 443
#           tg1: 80
#           tg2: 443
#           protocal: TCP
#           http: http
#           nodeport: 32593
#           https: https
#           app: nginx-ingress-nginx-ingress
#         nginx:
#           name: nginx-ingress
#           namespace1: argocd
#           namespace2: nginx-ingress
#           project: default
#           chart: nginx-ingress
#           repo: https://helm.nginx.com/stable
#           targetrevision: 0.4.1
#           server: https://kubernetes.default.svc
#   destination:
#     server: "https://kubernetes.default.svc"
#     namespace: helm
#   syncPolicy:
#     automated:
#       prune: true
#       selfHeal: true
#     syncOptions:
#       - CreateNamespace=true
# YAML
# }
