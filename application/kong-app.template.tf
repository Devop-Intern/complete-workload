# resource "kubectl_manifest" "..." {
#   depends_on = [helm_release.argocd-helm]
#   yaml_body  = <<YAML
# apiVersion: argoproj.io/v1alpha1
# kind: Application
# metadata:
#   name: ...
#   namespace: argocd
# spec:
#   project: default
#   source:
#     repoURL: "https://github.com/Devop-Intern/helm-template.git"
#     path: helm/kong
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
#           path: /kongecho
#           pathType: Exact
#         helloserver:
#           name: ...
#           image: tutum/hello-world:latest
#           replicas: 1
#           containerPort: 80
#           serviceType: ClusterIP
#           servicePort: 80
#           path: /konghello
#           pathType: Exact
#         pgadmin:
#           name: ...
#           image: dpage/pgadmin4
#           replicas: 1
#           containerPort: 80
#           serviceType: ClusterIP
#           servicePort: 80
#           path: /kongpgadmin
#           pathType: Prefix
#           email: ...
#           password: ...
#           scriptname: /kongpgadmin
#         ingress:
#           name: ...
#           pgadmin_name: ...
#           host: ...
#         ingressctl:
#           name: kong-ingress-controller
#           nodename: ...
#           namespaceapp: argocd
#           namespacedest: kong
#           project: default
#           chart: kong
#           repo: https://charts.konghq.com
#           targetrevision: 2.7.0
#           server: https://kubernetes.default.svc
#         nodeport:
#           name: kong
#           namespace: kong
#           type: NodePort
#           porthttp: 80
#           porthttps: 443
#           tghttp: 8000
#           tghttps: 8443
#           protocal: TCP
#           nodeport: ...
#           http: http
#           https: https
#           app: kong
#   destination:
#     server: "https://kubernetes.default.svc"
#     namespace: kong-workload
#   syncPolicy:
#     automated:
#       prune: true
#       selfHeal: true
#     syncOptions:
#       - CreateNamespace=true
# YAML
# }
