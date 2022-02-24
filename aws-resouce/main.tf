module "eks" {
  source = "./eks"

  #ESK Cluster
  cluster_name    = var.eks.cluster_name
  cluster_version = var.eks.cluster_version
  vpc_id          = var.eks.vpc_id
  # subnet_ids      = ["subnet-6221ed2a", "subnet-7e65ee27", "subnet-977ea2f1"]
  # subnet_ids      = [for subnet in var.eksSubnet : subnet]
  subnet_ids = var.eks_subnet_ids

  #Default manage node
  ami_type               = var.default_manage_node.ami_type
  disk_size              = var.default_manage_node.disk_size
  default_instance_types = [var.default_manage_node.default_instance_types]

  #Manage node group
  manage_node_group_name = var.manage_node_group.manage_node_group_name
  min_size               = var.manage_node_group.min_size
  max_size               = var.manage_node_group.max_size
  desired_size           = var.manage_node_group.desired_size
  instance_types         = [var.manage_node_group.instance_types]
  capacity_type          = var.manage_node_group.capacity_type
}

module "vpc" {
  source = "./vpc"

  #NLB
  # lb_version = "~> 6.0"
  lb_name                           = var.my_lb.lb_name
  lb_type                           = var.my_lb.lb_type
  vpc_id                            = var.my_lb.vpc_id
  subnet_ids                        = var.lb_subnet_ids
  http_listeners_port               = var.http_listeners.port
  http_listeners_protocol           = var.http_listeners.protocol
  http_listeners_target_group_index = var.http_listeners.target_group_index
  target_groups_name_prefix         = var.target_groups.name_prefix
  target_groups_backend_protocol    = var.target_groups.backend_protocol
  target_groups_backend_port        = var.target_groups.backend_port
  target_type                       = var.target_groups.target_type
  # access_logs_bucket_name           = var.access_logs.bucket_name
  # access_logs_prefix                = var.access_logs.prefix 
  # access_logs_enabled               = var.access_logs.enabled  

  #autocaling group
  autoscaling_group_name = module.eks.eks_managed_node_groups.newMNG.node_group_resources[0].autoscaling_groups[0].name

  #secutity group rule
  security_group_rule_type        = "ingress"
  security_group_rule_description = "all port ggez"
  security_group_rule_form_port   = 0
  security_group_rule_to_port     = 65535
  security_group_rule_protocol    = "all"
  security_group_id               = module.eks.eks_managed_node_groups.newMNG.security_group_id
  security_group_rule_cidr_blocks = ["0.0.0.0/0"]

  #secutity group rule egress
  security_group_rule_type2        = "egress"
  security_group_rule_description2 = "outbound all port"
  security_group_rule_form_port2   = 0
  security_group_rule_to_port2     = 65535
  security_group_rule_protocol2    = "all"
  security_group_id2               = module.eks.eks_managed_node_groups.newMNG.security_group_id
  security_group_rule_cidr_blocks2 = ["0.0.0.0/0"]
}


module "rds" {
  source = "./rds"

  vpc_id = "vpc-b8d13ade"

  #RDS
  rds_identifier            = var.rds.rds_identifier
  rds_engine                = var.rds.rds_engine
  rds_engine_version        = var.rds.rds_engine_version
  rds_instance_class        = var.rds.rds_instance_class
  rds_allocated_storage     = var.rds.rds_allocated_storage
  rds_max_allocated_storage = var.rds.rds_max_allocated_storage
  rds_name                  = var.rds.rds_name
  rds_username              = var.rds.rds_username
  rds_password              = var.rds.rds_password
  rds_port                  = var.rds.rds_port
  # security_group_ids              = ""
  rds_monitoring_interval  = var.rds.rds_monitoring_interval
  rds_monitoring_role_name = var.rds.rds_monitoring_role_name
  # rds_create_monitoring_role      = ""
  # rds_create_db_subnet_group      = ""
  db_subnet_group_name = var.rds.db_subnet_group_name
  # db_subnet_group_use_name_prefix = ""
  db_subnet_group_description = var.rds.db_subnet_group_description
  # subnet_ids = []
  family                  = var.rds.family
  backup_retention_period = var.rds.backup_retention_period
  # performance_insights_kms_key_id       = "arn:aws:kms:ap-southeast-1:115595541515:key/44cffea8-6f93-403c-9d53-bce9d9616f1c"
  # performance_insights_retention_period = ""

  #rds security group
  security_group_name             = var.rds.security_group_name
  security_group_description      = var.rds.security_group_description
  security_group_cidr_from_port   = var.rds.security_group_cidr_from_port
  security_group_cidr_to_port     = var.rds.security_group_cidr_to_port
  security_group_cidr_protocol    = var.rds.security_group_cidr_protocol
  security_group_cidr_description = var.rds.security_group_cidr_description
  security_group_cidr_block       = var.rds.security_group_cidr_block

  #rds subnet
  subnet_name                    = var.subnet_name
  subnet_cidr_block              = var.subnet_cidr_block
  subnet_availability_zone       = var.subnet_availability_zone
  subnet_map_public_ip_on_launch = var.subnet_map_public_ip_on_launch

}

# resource "helm_release" "argocd-helm" {
#   name = "argocd-helm"

#   repository       = "https://argoproj.github.io/argo-helm"
#   chart            = "argo-cd"
#   create_namespace = true
#   namespace        = "argocd"
# }
