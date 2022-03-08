module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                    = var.cluster_name
  cluster_version                 = var.cluster_version
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  eks_managed_node_group_defaults = {
    ami_type       = var.ami_type
    disk_size      = var.disk_size
    instance_types = var.default_instance_types
  }

  eks_managed_node_groups = {
    (var.manage_node_group_name) = {
      min_size       = var.min_size
      max_size       = var.max_size
      desired_size   = var.desired_size
      instance_types = var.instance_types
      capacity_type  = var.capacity_type
    }
  }
}


module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  vpc_id             = var.lb_vpc_id
  subnets            = var.lb_subnets
  name               = var.lb_name
  load_balancer_type = var.lb_type


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
  for_each = zipmap(
    [for name, node_group in module.eks.eks_managed_node_groups : name],
    [for name, node_group in module.eks.eks_managed_node_groups : node_group]
  )

  autoscaling_group_name = each.value.node_group_resources[0].autoscaling_groups[0].name
  alb_target_group_arn   = var.alb_target_group_arn
}
