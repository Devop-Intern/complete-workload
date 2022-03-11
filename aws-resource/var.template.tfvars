# ################################################################################
# # AWS Config
# ################################################################################
# # provider-aws
# profile = "..."
# region  = "ap-southeast-1"
# # update-kubeconfig
# update-kubeconfig = "aws eks update-kubeconfig --region ap-southeast-1 --name ... --profile ..."

# resource_name = "..."
# ################################################################################
# # Virtual Private Cloud [VPC]
# ################################################################################
# vpc = {
#   vpc_cidr                                  = "..."
# vpc list = {
# vpc_azs              = ["..."]
# vpc_private_subnets  = ["..."]
# vpc_public_subnets   = ["..."]
# vpc_database_subnets = ["..."]
# }
# }

# ################################################################################
# # Elastic Cloud Kubernetes [EKS]
# ################################################################################
# eks = {
#   cluster_version = "1.21"
# # manage node group  
# manage_node_group = {
#   desired_size           = 1
#   instance_types         = "t3.medium"
# }
# }

# # Network Load balancer [NLB] 
# target_groups = {
#   backend_protocol = "TCP"
#   backend_port     = 32593
#   target_type      = "instance"
# }
# # Access Logs [S3]
# # access_logs = {
# #   bucket_name = "..."
# #   prefix      = "logs"
# #   enabled     = true
# # }
# }

# ################################################################################
# # Relational Database Service [RDS]
# ################################################################################
# rds = {
# app = {
#   rds_engine                      = "postgres"
#   rds_engine_version              = "14.1"
#   rds_instance_class              = "db.t4g.small"
#   rds_allocated_storage           = 20
#   rds_max_allocated_storage       = 100
#   rds_username                    = "..."
#   rds_password                    = "..."
#   rds_port                        = "5432"
#   db_subnet_group_description     = "..."
# }
#   # rds security group
#   rds_security_group = {
#   security_group_description      = "security group for rds service"
#   security_group_cidr_from_port   = "0"
#   security_group_cidr_to_port     = "65535"
#   security_group_cidr_protocol    = "all"
#   security_group_cidr_description = "enable all traffic"
#   security_group_cidr_block       = "0.0.0.0/0"
# }
# }