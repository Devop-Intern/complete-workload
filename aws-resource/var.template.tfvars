################################################################################
# AWS Config
################################################################################
# provider-aws
profile = "banjov2"
region  = "ap-southeast-1"
# update-kubeconfig
update-kubeconfig = "aws eks update-kubeconfig --region ap-southeast-1 --name banjo_clus3_var --profile banjov2"

################################################################################
# Virtual Private Cloud [VPC]
################################################################################
vpc = {
  vpc_name                         = "vpc-banjo"
  vpc_cidr                         = "172.31.0.0/16"
  vpc_enable_dns_hostnames         = true
  vpc_enable_nat_gateway           = true
  vpc_single_nat_gateway           = true
  vpc_one_nat_gateway_per_az       = false
  subnet_map_public_ip_on_launch   = false
  vpc_create_database_subnet_group = false
}
vpc_azs              = ["ap-southeast-1a", "ap-southeast-1b"]
vpc_private_subnets  = ["172.31.128.0/20", "172.31.144.0/20"]
vpc_public_subnets   = ["172.31.0.0/20", "172.31.16.0/20"]
vpc_database_subnets = ["172.31.48.0/20", "172.31.80.0/20"]



################################################################################
# Elastic Cloud Kubernetes [EKS]
################################################################################
eks = {
  cluster_name    = "banjo_clus3_var"
  cluster_version = "1.21"
}

# default manage node 
default_manage_node = {
  ami_type               = "AL2_x86_64"
  disk_size              = 20
  default_instance_types = "t3.medium"
}

# manage node group  
manage_node_group = {
  manage_node_group_name = "banjo_managednode3"
  min_size               = 1
  max_size               = 2
  desired_size           = 1
  instance_types         = "t3.medium"
  capacity_type          = "ON_DEMAND"
}


# Network Load balancer [NLB] 
my_lb = {
  lb_name = "my-nlb-banjo"
  lb_type = "network"
}

http_listeners = {
  port               = 80
  protocol           = "TCP"
  target_group_index = 0
}

target_groups = {
  name_prefix      = "gg"
  backend_protocol = "TCP"
  backend_port     = 32593
  target_type      = "instance"
}

## Access Logs [S3]
# access_logs = {
#   bucket_name = "buckettestbanjo"
#   prefix      = "logs"
#   enabled     = true
# }

################################################################################
# Relational Database Service [RDS]
################################################################################
rds = {
  rds_identifier                  = "pgbanjogg"
  rds_engine                      = "postgres"
  rds_engine_version              = "14.1"
  rds_instance_class              = "db.t4g.small"
  rds_allocated_storage           = 20
  rds_max_allocated_storage       = 100
  rds_name                        = "pgbanjogg"
  rds_username                    = "postgres"
  rds_password                    = "postgres"
  rds_port                        = "5432"
  rds_monitoring_interval         = "60"
  rds_monitoring_role_name        = "RDSMonitoringBanjoRole"
  db_subnet_group_name            = "banjo-subgroup-test"
  db_subnet_group_use_name_prefix = false
  db_subnet_group_description     = "testnajaaa"
  family                          = "postgres14"
  backup_retention_period         = 7
  publicly_accessible             = false
  multi_az                        = false
  deletion_protection             = false
  delete_automated_backups        = true
  skip_final_snapshot             = true

  # rds security group
  security_group_name             = "rds-banjo"
  security_group_description      = "security group for rds service"
  security_group_cidr_from_port   = "0"
  security_group_cidr_to_port     = "65535"
  security_group_cidr_protocol    = "all"
  security_group_cidr_description = "enable all traffic"
  security_group_cidr_block       = "0.0.0.0/0"

}
