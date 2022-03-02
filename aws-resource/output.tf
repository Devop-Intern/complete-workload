#EKS
output "eks_managed_node_groups" {
  value = module.eks.eks_managed_node_groups
}
output "node_group_resources" {
  value = module.eks.node_group_resources
}
output "security_group_id_manage_node" {
  value = module.eks.security_group_id_manage_node
}
output "for_loop_node_group_resources" {
  value = [for k, v in [module.eks.node_group_resources] : v[k].autoscaling_groups]
}
output "for2_loop_node_group_resources" {
  value = [for k, v in [for k, v in [module.eks.node_group_resources] : v[k].autoscaling_groups] : v[k].name][0]
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

# #SECURITY_GROUP
# output "security_group_id" {
#   value = module.rds.security_group_id
# }












