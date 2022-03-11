variable "resource_name" {
  type = string
}

# EKS
variable "eks" {
  type = object({
    cluster_version   = string
    manage_node_group = map(any)
  })
}

# NLB
variable "nlb" {
  type = object({
    target_groups = object({
      backend_protocol = string
      backend_port     = number
      target_type      = string
    })
  })
}
# access_logs    = map(string)
