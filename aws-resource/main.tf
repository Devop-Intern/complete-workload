module "eks" {
  source = "./eks"

  # EKS Cluster
  cluster_name    = var.resource_name
  cluster_version = var.eks.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  # Manage node group
  manage_node_group_name = var.resource_name
  desired_size           = var.eks.manage_node_group.desired_size
  instance_types         = [var.eks.manage_node_group.instance_types]

  # NLB
  lb_vpc_id                         = module.vpc.vpc_id
  lb_subnets                        = module.vpc.public_subnets
  lb_name                           = var.resource_name
  target_groups_backend_protocol    = var.nlb.target_groups.backend_protocol
  target_groups_backend_port        = var.nlb.target_groups.backend_port
  target_type                       = var.nlb.target_groups.target_type
  # access_logs_bucket_name           = var.nlb.access_logs.bucket_name
  # access_logs_prefix                = var.nlb.access_logs.prefix 
  # access_logs_enabled               = var.nlb.access_logs.enabled 

  # autocaling group
  alb_target_group_arn = module.eks.nlb_target_group_arns

}