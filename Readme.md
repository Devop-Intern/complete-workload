# Tutorial

## 1) Apply EKS

**1.1   cd ./main** <br>
**1.2** `terraform init` <br>
**1.3** `terraform apply -var-file="var.tfvars"`

## 2) แก้ Host ของ application.tf ใน kube-argocd โดยใช้ dns name ของ nlb ใน aws

```
ingress: 
    name: ingress-cli
    host: ${nlbDNSName}
```

## 3) Personal config

**3.1   file: application.tf** <br>
**Personal email/password สำหรับ login pgadmin**
```
        pgadmin:
          name: pgadmin
          image: dpage/pgadmin4
          replicas: 1
          containerPort: 80
          serviceType: ClusterIP
          servicePort: 80
          path: /pgadmin
          pathType: Prefix
          email: ${email}
          password: ${password}
```
**Personal git repo (helm repo only)**
```
spec:
  project: default
  source:
    repoURL: ${gitrepo}
```
**3.2   file: kube-argocd.tf** <br>
**Personal profile/cluster name**
```
resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region ap-southeast-1 --name ${clustername} --profile ${localprofile}"
  }
```

## 4) Apply App

**4.1** cd ./kube-argocd <br>
**4.2** `terraform init` <br>
**4.3** `terraform apply`