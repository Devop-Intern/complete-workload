# EKS
variable "eks" {
  type = object({
    cluster_name        = string
    cluster_version     = string
    default_manage_node = map(any)
    manage_node_group   = map(any)
  })
}

# NLB
variable "nlb" {
  type = object({
    lb_name        = string
    lb_type        = string
    http_listeners = map(any)
    target_groups  = map(any)
  })
}
# access_logs    = map(string)


variable "vpc" {
  type = object({
    vpc_name                         = string
    vpc_cidr                         = string
    vpc_enable_dns_hostnames         = bool
    vpc_enable_nat_gateway           = bool
    vpc_single_nat_gateway           = bool
    vpc_one_nat_gateway_per_az       = bool
    subnet_map_public_ip_on_launch   = bool
    vpc_create_database_subnet_group = bool
    vpc_list                         = map(list(string))
  })
}

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
