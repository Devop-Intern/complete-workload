output "eks_managed_node_groups" {
  value = module.eks.eks_managed_node_groups
}
output "lb_dns_name" {
  value = module.vpc.lb_dns_name
}
