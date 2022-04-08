# ################################################################################
# # AWS Config
# ################################################################################
# # provider-aws
# profile = "..."
# region  = "ap-southeast-1"
# # update-kubeconfig
# update-kubeconfig = "aws eks update-kubeconfig --region ap-southeast-1 --name ...-cluster --profile ..."

# resource_name = "..."
# ################################################################################
# # Virtual Private Cloud [VPC]
# ################################################################################
# vpc = {
#   vpc_cidr = "..."
#   vpc_list = {
#     vpc_azs              = ["..."]
#     vpc_private_subnets  = ["..."]
#     vpc_public_subnets   = ["..."]
#     vpc_database_subnets = ["..."]
#   }
# }


# # ################################################################################
# # # Elastic Cloud Kubernetes [EKS]
# # ################################################################################
# eks = {
#   cluster_version = "1.21"
#   # manage node group  
#   manage_node_groups = {
#     # First gruop(group_1) must be created iam_role, so iam_role_arn don't input data, just leave it away.
#     # The rest group mustn't be created iam_role, use exist role instead by input iam_role_arn from group_1.  
#     group_1 = {
#       node_name       = "..."
#       desired_size    = ...
#       instance_types  = "t3.medium"
#       create_iam_role = true
#       iam_role_name   = "..."
#       iam_role_arn    = ""
#     }
#     # The rest group
#     group_2 = {
#       node_name       = "..."
#       desired_size    = ...
#       instance_types  = "t3.medium"
#       create_iam_role = false
#       iam_role_name   = ""
#       iam_role_arn    = "arn:aws:iam::115595541515:role/{$group_1.iam_role_name}"
#     }
#   }
# }

# # Network Load balancer [NLB] 
# nlb = {
#   backend_protocol = "TCP"
#   target_type      = "instance"
#   target_groups = {
#     group_1 = {
#       name         = "kong"
#       backend_port = 8000
#     }
#     group_2 = {
#       name         = "traefik"
#       backend_port = ...
#     }
#   }
#   http_tcp_listeners = {
#     group_1 = {
#       port = ...
#     }
#     group_2 = {
#       port = ...
#     }
#   }

#   # Access Logs [S3]
#   # access_logs = {
#   #   bucket_name = "..."
#   #   prefix      = "logs"
#   #   enabled     = true
#   # }
# }

# ################################################################################
# # Relational Database Service [RDS]
# ################################################################################
# rds = {
#   app = {
#   rds_engine                      = "postgres"
#   rds_engine_version              = "14.1"
#   rds_instance_class              = "db.t4g.small"
#   rds_allocated_storage           = 20
#   rds_max_allocated_storage       = 100
#   rds_username                    = "..."
#   rds_password                    = "..."
#   rds_port                        = "5432"
#   db_subnet_group_description     = "My description"
# }
#   # rds security group
#   rds_security_group = {
#   security_group_description      = "security group for rds service"
#   security_group_cidr_from_port   = "0"
#   security_group_cidr_to_port     = "65535"
#   security_group_cidr_protocol    = "all"
#   security_group_cidr_description = "enable all traffic"
#   security_group_cidr_block       = "0.0.0.0/0"
#   }
# }

