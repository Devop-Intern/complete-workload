# Tutorial

## 1) Apply EKS

**1.1** cd ./main <br>
**1.2** `terraform init` <br>
**1.3** `terraform apply -var-file="var.tfvars"`

## 2) แก้ Host ของ application.tf ใน kube-argocd โดยใช้ dns name ของ nlb ใน aws

```
ingress: 
    host: ${nlbDNSName}
```

## 3) Apply App

**3.1** cd ./kube-argocd <br>
**3.1** `terraform init` <br>
**3.2** `terraform apply`