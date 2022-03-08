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
