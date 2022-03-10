# EKS
output "eks_managed_node_groups" {
  value = module.eks.eks_managed_node_groups
}
output "security_group_id_manage_node" {
  value = lookup("${lookup(module.eks.eks_managed_node_groups, var.manage_node_group_name)}", "security_group_id")
}

# NLB
output "lb_dns_name" {
  value = module.nlb.lb_dns_name
}
output "nlb_target_group_arns" {
  value = module.nlb.target_group_arns[0]
}
