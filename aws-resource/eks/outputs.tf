# EKS
output "eks_managed_node_groups" {
  value = module.eks.eks_managed_node_groups
}
output "security_group_id_manage_node" {
  value = lookup("${lookup(module.eks.eks_managed_node_groups, "${var.manage_node_group_name}-${var.manage_node_group_name_suffix}")}", "security_group_id")
}

# NLB
output "lb_dns_name" {
  value = module.nlb.lb_dns_name
}
output "nlb_target_group_arns" {
  value = module.nlb.target_group_arns[0]
}

output "node_groups_iam_role_arn" {
  value = lookup("${lookup(module.eks.eks_managed_node_groups, "${var.manage_node_group_name}-${var.manage_node_group_name_suffix}")}", "iam_role_arn")
}

#kube-config
output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}
output "cluster_id" {
  value = module.eks.cluster_id
}
output "cluster_arn" {
  value = module.eks.cluster_arn
}
