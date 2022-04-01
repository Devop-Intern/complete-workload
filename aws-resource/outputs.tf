# EKS
output "eks_managed_node_groups" {
  value = module.eks.eks_managed_node_groups
}
output "node_groups_iam_role_arn" {
  value = module.eks.node_groups_iam_role_arn
}

# NLB
output "lb_dns_name" {
  value = module.eks.lb_dns_name
}
output "nlb_target_group_arns" {
  value = module.eks.nlb_target_group_arns
}
output "sort_nlb_target_group_arns" {
  value = sort(module.eks.nlb_target_group_arns)
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







output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}
output "cluster_id" {
  value = module.eks.cluster_id
}


output "endpoint" {
  value = data.aws_eks_cluster.selected.endpoint
}
output "token" {
  value = data.aws_eks_cluster_auth.selected.token
}
output "kubeconfig-certificate-authority-data2" {
  value = data.aws_eks_cluster.selected.certificate_authority[0].data
}
