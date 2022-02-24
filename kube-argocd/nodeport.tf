resource "kubectl_manifest" "nodeport" {
  depends_on = [helm_release.argocd-helm]
  yaml_body  = <<YAML
apiVersion: v1
kind: Service
metadata:
  name: nginx-ingress
  namespace: nginx-ingress
spec:
  type: NodePort
  ports:
    - port: 80
      targetPort: 80
      protocol: TCP
      name: http
      nodePort: 32593
    - port: 443
      targetPort: 443
      protocol: TCP
      name: https
  selector:
    app: nginx-ingress-nginx-ingress
YAML
}
