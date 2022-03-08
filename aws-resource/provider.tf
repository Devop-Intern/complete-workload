provider "aws" { 
  profile = var.profile
  region  = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
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
