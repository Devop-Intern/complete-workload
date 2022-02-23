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
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      instance_types = var.instance_types
      capacity_type  = var.capacity_type
    }
  }
}

# resource "aws_autoscaling_attachment" "asg_attachment_bar" {
#   autoscaling_group_name = module.eks.eks_managed_node_groups.banjo_managednode3.node_group_resources[0].autoscaling_groups[0].name
#   alb_target_group_arn   = module.nlb.target_group_arns[0]
# }


# resource "aws_security_group_rule" "access_rule" {
#   type        = var.scgr_type
#   description = var.scgr_description
#   from_port   = var.scgr_form_port
#   to_port     = var.scgr_to_port
#   protocol    = var.scgr_protocol
#   security_group_id = module.eks.eks_managed_node_groups.banjo_managednode3.security_group_id
#   cidr_blocks = var.scgr_cidr_blocks
# }

