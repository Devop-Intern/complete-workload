module "nlb" {
  source = "terraform-aws-modules/alb/aws"

  # version            = var.lb_version
  # version            = "~> 6.0"
  name               = var.lb_name
  load_balancer_type = var.lb_type

  vpc_id  = var.vpc_id
  subnets = var.subnet_ids
  #   https_listeners = [
  #     {
  #       port               = 443
  #       protocol           = "TLS"
  #       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
  #       target_group_index = 0
  #     }
  #   ]
  http_tcp_listeners = [
    {
      port               = var.http_listeners_port
      protocol           = var.http_listeners_protocol
      target_group_index = var.http_listeners_target_group_index
    }
  ]

  target_groups = [
    {
      name_prefix      = var.target_groups_name_prefix
      backend_protocol = var.target_groups_backend_protocol
      backend_port     = var.target_groups_backend_port
      target_type      = var.target_type
    }
  ]

  # access_logs = {
  #   bucket  = var.access_logs_bucket_name
  #   prefix  = var.access_logs_prefix
  #   enabled = var.access_logs_enabled
  # }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = var.autoscaling_group_name
  # module.eks.eks_managed_node_groups.sup_node.node_group_resources[0].autoscaling_groups[0].name
  alb_target_group_arn = module.nlb.target_group_arns[0]
}

resource "aws_security_group_rule" "access_rule" {
  type              = var.security_group_rule_type
  description       = var.security_group_rule_description
  from_port         = var.security_group_rule_form_port
  to_port           = var.security_group_rule_to_port
  protocol          = var.security_group_rule_protocol
  security_group_id = var.security_group_id
  # module.eks.eks_managed_node_groups.sup_node.security_group_id
  cidr_blocks = var.security_group_rule_cidr_blocks
}

resource "aws_security_group_rule" "access_rule2" {
  type              = var.security_group_rule_type2
  description       = var.security_group_rule_description2
  from_port         = var.security_group_rule_form_port2
  to_port           = var.security_group_rule_to_port2
  protocol          = var.security_group_rule_protocol2
  security_group_id = var.security_group_id2
  # module.eks.eks_managed_node_groups.sup_node.security_group_id
  cidr_blocks = var.security_group_rule_cidr_blocks2
}
