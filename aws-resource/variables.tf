# EKS
variable "eks" {
  type = map(any)
}
variable "default_manage_node" {
  type = map(any)
}
variable "manage_node_group" {
  type = map(any)
}

# VPC
variable "vpc" {
  type = map(any)
}

# VPC-azs-subnet
variable "vpc_azs" {
  type = list(string)
}
variable "vpc_private_subnets" {
  type = list(string)
}
variable "vpc_public_subnets" {
  type = list(string)
}

# VPC-database-subnet
variable "vpc_database_subnets" {
  type = list(string)
}




# NLB
variable "my_lb" {
  type = map(any)
}
variable "http_listeners" {
  type = map(any)
}
variable "target_groups" {
  type = map(any)
}
# variable "access_logs" {
#   type = map(any)
# }


# RDS
variable "rds" {
  type = map(any)
}


# update-kubeconfig
variable "update-kubeconfig" {
  type = string
}


# provider-aws
variable "profile" {
  type = string
}
variable "region" {
  type = string
}
