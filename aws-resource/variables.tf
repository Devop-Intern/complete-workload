# EKS
variable "eks" {
  type = object({
    cluster_name        = string
    cluster_version     = string
    default_manage_node = map(string)
    manage_node_group   = map(string)
  })
}

# NLB
variable "nlb" {
  type = object({
    lb_name = string
    lb_type = string
    http_listeners = map(string)
    target_groups  = map(string)
  })
}
    # access_logs    = map(string)



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
