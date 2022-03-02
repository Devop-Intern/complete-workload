# ################################################################################
# # AWS Config
# ################################################################################
# # provider-aws
# profile = "..."
# region  = "ap-southeast-1"
# # update-kubeconfig
# update-kubeconfig = "aws eks update-kubeconfig --region ap-southeast-1 --name ... --profile ..."

# ################################################################################
# # Virtual Private Cloud [VPC]
# ################################################################################
# vpc = {
#   vpc_name                                  = "..."
#   vpc_cidr                                  = "..."
#   vpc_enable_dns_hostnames                  = true
#   vpc_manage_default_route_table            = true
#   vpc_default_route_table_name              = "..."
#   vpc_default_route_table_routes_cidr_block = "0.0.0.0/0"
# }

# # subnet
# subnet_name                    = ["..."]
# subnet_cidr_block              = ["..."]
# subnet_availability_zone       = ["..."]
# subnet_map_public_ip_on_launch = true

# # internet_gateway 
# igw_name = "..."


# ################################################################################
# # Elastic Cloud Kubernetes [EKS]
# ################################################################################
# eks = {
#   cluster_name    = "..."
#   cluster_version = "1.21"
# }

# # default manage node 
# default_manage_node = {
#   ami_type               = "AL2_x86_64"
#   disk_size              = 20
#   default_instance_types = "t3.medium"
# }

# # manage node group  
# manage_node_group = {
#   manage_node_group_name = "..."
#   min_size               = 1
#   max_size               = 2
#   desired_size           = 1
#   instance_types         = "t3.medium"
#   capacity_type          = "ON_DEMAND"
# }

# # Network Load balancer [NLB] 
# my_lb = {
#   lb_name = "..."
#   lb_type = "network"
# }

# http_listeners = {
#   port               = 80
#   protocol           = "TCP"
#   target_group_index = 0
# }

# target_groups = {
#   name_prefix      = "..."
#   backend_protocol = "TCP"
#   backend_port     = 30080
#   target_type      = "instance"
# }

# # Access Logs [S3]
# # access_logs = {
# #   bucket_name = "..."
# #   prefix      = "logs"
# #   enabled     = true
# # }

# ################################################################################
# # Relational Database Service [RDS]
# ################################################################################
# rds = {
#   rds_identifier                  = "..."
#   rds_engine                      = "postgres"
#   rds_engine_version              = "14.1"
#   rds_instance_class              = "db.t4g.small"
#   rds_allocated_storage           = 20
#   rds_max_allocated_storage       = 100
#   rds_name                        = "..."
#   rds_username                    = "..."
#   rds_password                    = "..."
#   rds_port                        = "5432"
#   rds_monitoring_interval         = "60"
#   rds_monitoring_role_name        = "..."
#   db_subnet_group_name            = "..."
#   db_subnet_group_use_name_prefix = false
#   db_subnet_group_description     = "subnet for rds database service"
#   family                          = "postgres14"
#   backup_retention_period         = 7
#   publicly_accessible             = false
#   multi_az                        = false
#   deletion_protection             = false
#   delete_automated_backups        = true
#   skip_final_snapshot             = true

#   # rds security group
#   security_group_name             = "..."
#   security_group_description      = "security group for rds service"
#   security_group_cidr_from_port   = "0"
#   security_group_cidr_to_port     = "65535"
#   security_group_cidr_protocol    = "all"
#   security_group_cidr_description = "enable all traffic"
#   security_group_cidr_block       = "0.0.0.0/0"
# }



