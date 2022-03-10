# EKS
output "eks_managed_node_groups" {
  value = module.eks.eks_managed_node_groups
}

# NLB
output "lb_dns_name" {
  value = module.eks.lb_dns_name
}
output "nlb_target_group_arns" {
  value = module.eks.nlb_target_group_arns
}

# VPC
output "vpc_name" {
  value = module.vpc.vpc_name
}
output "vpc_id" {
  value = module.vpc.vpc_id
}

# subnet
output "private_subnets" {
  value = module.vpc.private_subnets
}
output "public_subnets" {
  value = module.vpc.public_subnets
}
output "database_subnets" {
  value = module.vpc.database_subnets
}

# security group
output "security_group_id" {
  value = module.rds.security_group_id
}





















# output "self_managed_node_group_defaults" {
#   value = module.eks.self_managed_node_group_defaults
# }
# output "self_managed_node_groups" {
#   value = module.eks.self_managed_node_groups
# }




# output "default_route_table_id" {
#   value = module.vpc.default_route_table_id
# }
# output "private_subnets" {
#   value = module.vpc.private_subnets
# }
# output "public_subnets" {
#   value = module.vpc.public_subnets
# }
# output "private_route_table_ids" {
#   value = module.vpc.private_route_table_ids
# }
# output "private_nat_gateway_route_ids" {
#   value = module.vpc.private_nat_gateway_route_ids
# }

# output "igw_id" {
#   value = module.vpc.igw_id
# }










