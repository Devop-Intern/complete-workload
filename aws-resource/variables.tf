#EKS
variable "eks" {
  type = map(any)
}
variable "default_manage_node" {
  type = map(any)
}
variable "manage_node_group" {
  type = map(any)
}


#VPC
variable "vpc" {
  type = map(any)
}


#SUBNET
variable "subnet_name" {
  type = list(string)
}
variable "subnet_cidr_block" {
  type = list(string)
}
variable "subnet_availability_zone" {
  type = list(string)
}
variable "subnet_map_public_ip_on_launch" {
  type = bool
}


#internet_gateway
variable "igw_name" {
  type = string
}


#NLB
variable "my_lb" {
  type = map(any)
}
variable "http_listeners" {
  type = map(any)
}
variable "target_groups" {
  type = map(any)
}
variable "access_logs" {
  type = map(any)
}


#RDS
variable "rds" {
  type = map(any)
}


#update-kubeconfig
variable "update-kubeconfig" {
  type = string
}


#provider-aws
variable "profile" {
  type = string
}
variable "region" {
  type = string
}

