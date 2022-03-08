module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  enable_dns_hostnames         = var.vpc_enable_dns_hostnames
  enable_nat_gateway           = var.vpc_enable_nat_gateway
  single_nat_gateway           = var.vpc_single_nat_gateway
  one_nat_gateway_per_az       = var.vpc_one_nat_gateway_per_az
  azs                          = var.vpc_azs
  private_subnets              = var.vpc_private_subnets
  public_subnets               = var.vpc_public_subnets
  map_public_ip_on_launch      = var.subnet_map_public_ip_on_launch
  create_database_subnet_group = var.vpc_create_database_subnet_group
  database_subnets             = var.vpc_database_subnets
}

# security group rules
resource "aws_security_group_rule" "access_rule" {
  type              = var.security_group_rule_type
  description       = var.security_group_rule_description
  from_port         = var.security_group_rule_form_port
  to_port           = var.security_group_rule_to_port
  protocol          = var.security_group_rule_protocol
  security_group_id = var.security_group_id
  cidr_blocks       = var.security_group_rule_cidr_blocks
}

resource "aws_security_group_rule" "access_rule2" {
  type              = var.security_group_rule_type2
  description       = var.security_group_rule_description2
  from_port         = var.security_group_rule_form_port2
  to_port           = var.security_group_rule_to_port2
  protocol          = var.security_group_rule_protocol2
  security_group_id = var.security_group_id2
  cidr_blocks       = var.security_group_rule_cidr_blocks2
}
