################################################################################
# AWS Config
################################################################################
# provider-aws
profile = "banjov2"
region  = "ap-southeast-1"
# update-kubeconfig
update-kubeconfig = "aws eks update-kubeconfig --region ap-southeast-1 --name fff-cluster --profile banjov2"

resource_name = "fff"
################################################################################
# Virtual Private Cloud [VPC]
################################################################################
vpc = {
  vpc_cidr = "172.31.0.0/16"
  vpc_list = {
    vpc_azs              = ["ap-southeast-1a", "ap-southeast-1b"]
    vpc_private_subnets  = ["172.31.128.0/20", "172.31.144.0/20"]
    vpc_public_subnets   = ["172.31.0.0/20", "172.31.16.0/20"]
    vpc_database_subnets = ["172.31.48.0/20", "172.31.80.0/20"]
  }
}


# ################################################################################
# # Elastic Cloud Kubernetes [EKS]
# ################################################################################
eks = {
  cluster_version = "1.21"
  # manage node group  
  manage_node_groups = {
    # First gruop(group_1) must be created iam_role, so iam_role_arn don't input data, just leave it away.
    # The rest group mustn't be created iam_role, use exist role instead by input iam_role_arn from group_1.  
    group_1 = {
      node_name       = "fff"
      desired_size    = 1
      instance_types  = "t3.medium"
      create_iam_role = true
      iam_role_name   = "fff-worker_groups"
      iam_role_arn    = ""
    }
    # The rest group
    group_2 = {
      node_name       = "bb2"
      desired_size    = 1
      instance_types  = "t3.medium"
      create_iam_role = false
      iam_role_name   = ""
      iam_role_arn    = "arn:aws:iam::115595541515:role/fff-worker_groups"
    }
  }
}

# Network Load balancer [NLB] 
nlb = {
  target_groups = {
    backend_protocol = "TCP"
    backend_port     = 32593
    target_type      = "instance"
  }
  http_tcp_listeners = {
    group_1 = {
      port = 80
    }
    group_2 = {
      port = 8080
    }
  }

  # Access Logs [S3]
  # access_logs = {
  #   bucket_name = "buckettestbanjo"
  #   prefix      = "logs"
  #   enabled     = true
  # }
}

################################################################################
# Relational Database Service [RDS]
################################################################################
rds = {
  app = {
    rds_engine                  = "postgres"
    rds_engine_version          = "14.1"
    rds_instance_class          = "db.t4g.small"
    rds_allocated_storage       = 20
    rds_max_allocated_storage   = 100
    rds_username                = "postgres"
    rds_password                = "postgres"
    rds_port                    = "5432"
    db_subnet_group_description = "My description"
  }
  # rds security group
  rds_security_group = {
    security_group_description      = "security group for rds service"
    security_group_cidr_from_port   = "0"
    security_group_cidr_to_port     = "65535"
    security_group_cidr_protocol    = "all"
    security_group_cidr_description = "enable all traffic"
    security_group_cidr_block       = "0.0.0.0/0"
  }
}

