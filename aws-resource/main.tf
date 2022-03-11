

module "vpc" {
  source = "./vpc"

  # VPC
  vpc_name = var.vpc.vpc_name
  vpc_cidr = var.vpc.vpc_cidr

  vpc_azs              = var.vpc.vpc_list.vpc_azs
  vpc_private_subnets  = var.vpc.vpc_list.vpc_private_subnets
  vpc_public_subnets   = var.vpc.vpc_list.vpc_public_subnets
  vpc_database_subnets = var.vpc.vpc_list.vpc_database_subnets

  # secutity group rule ingress
  security_group_rule_type        = "ingress"
  security_group_rule_description = "inbound all port"
  security_group_rule_form_port   = 0
  security_group_rule_to_port     = 65535
  security_group_rule_protocol    = "all"
  security_group_id               = module.eks.security_group_id_manage_node
  security_group_rule_cidr_blocks = ["0.0.0.0/0"]

  #secutity group rule egress
  security_group_rule_type2        = "egress"
  security_group_rule_description2 = "outbound all port"
  security_group_rule_form_port2   = 0
  security_group_rule_to_port2     = 65535
  security_group_rule_protocol2    = "all"
  security_group_id2               = module.eks.security_group_id_manage_node
  security_group_rule_cidr_blocks2 = ["0.0.0.0/0"]
}

module "rds" {
  source = "./rds"

  # RDS
  rds_sg_vpc_id              = module.vpc.vpc_id
  rds_identifier             = var.rds.app.rds_identifier
  rds_engine                 = var.rds.app.rds_engine
  rds_engine_version         = var.rds.app.rds_engine_version
  rds_instance_class         = var.rds.app.rds_instance_class
  rds_allocated_storage      = var.rds.app.rds_allocated_storage
  rds_max_allocated_storage  = var.rds.app.rds_max_allocated_storage
  rds_name                   = var.rds.app.rds_name
  rds_username               = var.rds.app.rds_username
  rds_password               = var.rds.app.rds_password
  rds_port                   = var.rds.app.rds_port
  rds_vpc_security_group_ids = module.rds.security_group_id

  db_subnet_group_name        = var.rds.app.db_subnet_group_name
  db_subnet_group_description = var.rds.app.db_subnet_group_description
  subnet_ids                  = module.vpc.database_subnets

  #rds security group
  security_group_name             = var.rds.rds_security_group.security_group_name
  security_group_description      = var.rds.rds_security_group.security_group_description
  security_group_cidr_from_port   = var.rds.rds_security_group.security_group_cidr_from_port
  security_group_cidr_to_port     = var.rds.rds_security_group.security_group_cidr_to_port
  security_group_cidr_protocol    = var.rds.rds_security_group.security_group_cidr_protocol
  security_group_cidr_description = var.rds.rds_security_group.security_group_cidr_description
  security_group_cidr_block       = var.rds.rds_security_group.security_group_cidr_block

}

# update-kubeconfig 
resource "null_resource" "kubectl" {
  depends_on = [module.eks]
  provisioner "local-exec" {
    command = var.update-kubeconfig
  }
}
