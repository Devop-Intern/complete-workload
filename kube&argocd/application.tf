resource "kubectl_manifest" "new-app" {
  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: myapp-argo-application-helm
  namespace: argocd
spec:
  project: default
  source:
    repoURL: "https://github.com/Patiphannew/Helm-Deployment-Intern.git"
    path: helm
    targetRevision: HEAD
    helm:
      values: |-
        echoserver:
          name: echoserver
          image: ealen/echo-server:latest
          replicas: 1
          containerPort: 80
          serviceType: ClusterIP
          servicePort: 80
          path: /echo
          pathType: Exact
        helloworld:
          name: helloworld
          image: tutum/hello-world:latest
          replicas: 1
          containerPort: 80
          serviceType: ClusterIP
          servicePort: 80
          path: /hello
          pathType: Exact
        pgadmin:
          name: pgadmin
          image: dpage/pgadmin4
          replicas: 1
          containerPort: 80
          serviceType: ClusterIP
          servicePort: 80
          path: /pgadmin
          pathType: Prefix
          email: patiphan.t@appman.co.th
          password: admin
          scriptname: /pgadmin
        ingress:
          name: ingress-ctl
          host: newnlb-356131cf57f7a9d0.elb.ap-southeast-1.amazonaws.com
          annotations:
            kubernetes.io/ingress.class: nginx
            nginx.org/rewrites: "serviceName=pgadmin-svc rewrite=/pgadmin"
            nginx.org/rewrites: "serviceName=echoserver-svc rewrite=/"
            nginx.org/rewrites: "serviceName=helloworld-svc rewrite=/"
  destination:
    server: "https://kubernetes.default.svc"
    namespace: helm
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
YAML
}
