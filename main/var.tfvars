#######################  eks2  ######################################################################

eks = {
  cluster_name    = "new-cluster-3"
  cluster_version = "1.21"
  vpc_id          = "vpc-b8d13ade"
  #   cluster_endpoint_private_access = true
  #   cluster_endpoint_public_access  = true

}

eks_subnet_ids = ["subnet-6221ed2a", "subnet-7e65ee27", "subnet-977ea2f1"]

default_manage_node = {
  ami_type               = "AL2_x86_64"
  disk_size              = 20
  default_instance_types = "t3.medium"
  #   vpc_security_group_ids = "sg-030afe75"
}
manage_node_group = {
  manage_node_group_name = "newMNG"
  min_size               = 1
  max_size               = 2
  desired_size           = 1
  instance_types         = "t3.medium"
  capacity_type          = "ON_DEMAND"
}

#eksManagedNodeGroupGGEZ = "banjo_managednode3"



#######################  nlb  ######################################################################

my_lb = {
  lb_name = "newnlb"
  lb_type = "network"
  vpc_id  = "vpc-b8d13ade"
}
lb_subnet_ids = ["subnet-6221ed2a", "subnet-7e65ee27", "subnet-977ea2f1"]

http_listeners = {
  port               = 80
  protocol           = "TCP"
  target_group_index = 0
}

target_groups = {
  name_prefix      = "NEWGG"
  backend_protocol = "TCP"
  backend_port     = 32593
  target_type      = "instance"
}

access_logs = {
  bucket_name = "newbucket"
  prefix      = "logs"
  enabled     = true
}

#######################  RDS  ######################################################################

rds = {
  vpc_security_group_ids    = "sg-030afe75"
  rds_identifier            = "newpgdb"
  rds_engine                = "postgres"
  rds_engine_version        = "14.1"
  rds_instance_class        = "db.t4g.small"
  rds_allocated_storage     = 20
  rds_max_allocated_storage = 100
  rds_name                  = "newpg"
  rds_username              = "postgres"
  rds_password              = "postgres"
  rds_port                  = "5432"
  # security_group_ids              = ""
  rds_monitoring_interval  = "60"
  rds_monitoring_role_name = "NewRDSMonitoringRole"
  # rds_create_monitoring_role      = ""
  # rds_create_db_subnet_group      = ""
  db_subnet_group_name            = "new-subgroup"
  db_subnet_group_use_name_prefix = false
  db_subnet_group_description     = "helloworld"
  # subnet_ids = [aws_subnet.one.id, aws_subnet.second.id]
  family                  = "postgres14"
  backup_retention_period = 7
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
  security_group_name             = "rds-new"
  security_group_description      = "security group for rds service"
  security_group_cidr_from_port   = "0"
  security_group_cidr_to_port     = "65535"
  security_group_cidr_protocol    = "all"
  security_group_cidr_description = "enable all traffic"
  security_group_cidr_block       = "0.0.0.0/0"
}

#######################  subnet  ######################################################################

#rds subnet
subnet_name                    = ["hello", "world"]
subnet_cidr_block              = ["172.31.64.0/20", "172.31.96.0/20"]
subnet_availability_zone       = ["ap-southeast-1a", "ap-southeast-1b"]
subnet_map_public_ip_on_launch = false



  
