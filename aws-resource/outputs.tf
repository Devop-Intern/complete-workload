#EKS
output "eks_managed_node_groups" {
  value = module.eks.eks_managed_node_groups
}

#NLB
output "lb_dns_name" {
  value = module.eks.lb_dns_name
}
output "nlb_target_group_arns" {
  value = module.eks.nlb_target_group_arns
}


#VPC
output "vpc_name" {
  value = module.vpc.vpc_name
}
output "vpc_id" {
  value = module.vpc.vpc_id
}

#SUBNET
output "subnet_id" {
  value = module.vpc.subnet_id
}

#SECURITY_GROUP
output "security_group_id" {
  value = module.rds.security_group_id
}


