provider "aws" { 
  profile = var.profile
  region  = var.region
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
#   backend "s3" {
#     bucket = "bucketbkk"
#     key    = "./terraform.tfstate"
#     region = "ap-southeast-1"
#     # Enable State Locking
#     # dynamodb_table = "nopnithi-terraform-state-demo"
#     profile = "supphakit"
#   }
}

provider "kubectl" {
  load_config_file       = false
  host                   = data.aws_eks_cluster.selected.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.selected.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.selected.token
}
