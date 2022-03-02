module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  enable_dns_hostnames = var.vpc_enable_dns_hostnames

  manage_default_route_table = var.vpc_manage_default_route_table
  default_route_table_name   = var.vpc_default_route_table_name
  default_route_table_routes = [
    {
      cidr_block = var.vpc_default_route_table_routes_cidr_block
      gateway_id = aws_internet_gateway.gw.id
    }
  ]

}

# subnet for vpc
resource "aws_subnet" "subnet" {
  count                   = length(var.subnet_cidr_block)
  vpc_id                  = module.vpc.vpc_id
  cidr_block              = var.subnet_cidr_block[count.index]
  availability_zone       = var.subnet_availability_zone[count.index]
  map_public_ip_on_launch = var.subnet_map_public_ip_on_launch
  tags = {
    Name = var.subnet_name[count.index]
  }
}

# internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = var.igw_name
  }
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
