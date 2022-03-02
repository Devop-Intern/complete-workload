#EKS  
eks = {
  cluster_name    = "banjo_clus3_var"
  cluster_version = "1.21"
}
default_manage_node = {
  ami_type               = "AL2_x86_64"
  disk_size              = 20
  default_instance_types = "t3.medium"
}
manage_node_group = {
  manage_node_group_name = "banjo_managednode3"
  min_size               = 1
  max_size               = 2
  desired_size           = 1
  instance_types         = "t3.medium"
  capacity_type          = "ON_DEMAND"
}


#VPC
vpc = {
  vpc_name                                  = "vpc-banjo"
  vpc_cidr                                  = "172.31.0.0/16"
  vpc_enable_dns_hostnames                  = true
  vpc_manage_default_route_table            = true
  vpc_default_route_table_name              = "rt-bj"
  vpc_default_route_table_routes_cidr_block = "0.0.0.0/0"
}


#SUBNET 
subnet_name                    = ["banjoTestSup1", "banjoTestSup2"]
subnet_cidr_block              = ["172.31.48.0/20", "172.31.80.0/20"]
subnet_availability_zone       = ["ap-southeast-1a", "ap-southeast-1b"]
subnet_map_public_ip_on_launch = true



#internet_gateway
igw_name = "gw-banjo"



#NLB 
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

access_logs = {
  bucket_name = "buckettestbanjo"
  prefix      = "logs"
  enabled     = true
}


#RDS
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
  #   iam_database_authentication_enabled = false
  #   storage_encrypted     = true
  #   performance_insights_enabled = true
  #   performance_insights_kms_key_id = "arn:aws:kms:ap-southeast-1:115595541515:key/44cffea8-6f93-403c-9d53-bce9d9616f1c"
  #   performance_insights_retention_period = 7 
  publicly_accessible      = false
  multi_az                 = false
  deletion_protection      = false
  delete_automated_backups = true
  skip_final_snapshot      = true

  #rds security group
  security_group_name             = "rds-banjo"
  security_group_description      = "security group for rds service"
  security_group_cidr_from_port   = "0"
  security_group_cidr_to_port     = "65535"
  security_group_cidr_protocol    = "all"
  security_group_cidr_description = "enable all traffic"
  security_group_cidr_block       = "0.0.0.0/0"
}

#update-kubeconfig
update-kubeconfig = "aws eks update-kubeconfig --region ap-southeast-1 --name banjo_clus3_var --profile banjov2"

#provider-aws
profile = "banjov2"
region  = "ap-southeast-1"


