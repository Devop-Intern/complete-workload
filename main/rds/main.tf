module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  identifier = var.rds_identifier

  engine         = var.rds_engine
  engine_version = var.rds_engine_version
  instance_class = var.rds_instance_class

  allocated_storage     = var.rds_allocated_storage
  max_allocated_storage = var.rds_max_allocated_storage
  storage_encrypted     = true


  name     = var.rds_name
  username = var.rds_username
  password = var.rds_password
  port     = var.rds_port

  iam_database_authentication_enabled = var.rds_iam_database_authentication_enabled

  # vpc_security_group_ids = ["sg-030afe75"]
  vpc_security_group_ids = [module.rds_security_group.security_group_id]

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = var.rds_monitoring_interval
  monitoring_role_name   = var.rds_monitoring_role_name
  create_monitoring_role = var.rds_create_monitoring_role

  #   tags = {
  #     Owner       = "user"
  #     Environment = "dev"
  #   }

  # DB subnet group from resource "aws_subnet"
  create_db_subnet_group          = var.rds_create_db_subnet_group
  db_subnet_group_name            = var.db_subnet_group_name
  db_subnet_group_use_name_prefix = var.db_subnet_group_use_name_prefix
  db_subnet_group_description     = var.db_subnet_group_description
  subnet_ids                      = [for subnet in aws_subnet.rds_subnet : subnet.id]

  family                  = var.family
  backup_retention_period = var.backup_retention_period

  # performance_insights_enabled = var.performance_insights_enabled
  # performance_insights_kms_key_id = var.performance_insights_kms_key_id
  # performance_insights_retention_period = var.performance_insights_retention_period

  # DB snapshot is created before the DB instance is deleted, If true is specified, no DBSnapshot is created
  skip_final_snapshot = var.skip_final_snapshot

}

module "rds_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name            = var.security_group_name
  use_name_prefix = var.security_group_use_name_prefix
  description     = var.security_group_description
  vpc_id          = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = var.security_group_cidr_from_port
      to_port     = var.security_group_cidr_to_port
      protocol    = var.security_group_cidr_protocol
      description = var.security_group_cidr_description
      cidr_blocks = var.security_group_cidr_block
    }
  ]
}

resource "aws_subnet" "rds_subnet" {
  count                   = length(var.subnet_cidr_block)
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block[count.index]
  availability_zone       = var.subnet_availability_zone[count.index]
  map_public_ip_on_launch = var.subnet_map_public_ip_on_launch
  tags = {
    Name = var.subnet_name[count.index]
  }
}
