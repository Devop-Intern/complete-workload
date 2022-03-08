# EKS
variable "cluster_name" {
  description = "Name of Cluster"
  type        = string
  default     = ""
}
variable "cluster_version" {
  description = "Version of cluster"
  type        = string
  default     = ""
}
variable "cluster_endpoint_private_access" {
  description = "Endpoint private access to cluster"
  type        = bool
  default     = true
}
variable "cluster_endpoint_public_access" {
  description = "Endpoint public access to cluster"
  type        = bool
  default     = true
}
variable "vpc_id" {
  description = "ID of vpc"
  type        = string
  default     = ""
}
variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}

# default managed node
variable "ami_type" {
  description = "Ami type of manage node group"
  type        = string
  default     = ""
}
variable "disk_size" {
  description = "Size of manage node disk"
  type        = number
  default     = 0
}
variable "default_instance_types" {
  description = "A List of default instance type "
  type        = list(string)
  default     = []
}

# managed node group
variable "manage_node_group_name" {
  description = "Name of manage node group"
  type        = string
  default     = ""
}
variable "min_size" {
  description = "minimum number of manage node "
  type        = number
  default     = 0
}
variable "max_size" {
  description = "maximum number of manage node "
  type        = number
  default     = 0
}
variable "desired_size" {
  description = "desired number of manage node "
  type        = number
  default     = 0
}
variable "instance_types" {
  description = "A List of instance type "
  type        = list(string)
  default     = []
}
variable "capacity_type" {
  description = "capacity type of manage node group"
  type        = string
  default     = ""
}

# NLB
variable "lb_vpc_id" {
  description = "ID of vpc"
  type        = string
  default     = ""
}
variable "lb_subnets" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}
variable "lb_name" {
  description = "Name of load balancer"
  type        = string
  default     = ""
}
variable "lb_type" {
  description = "Type of load balancer"
  type        = string
  default     = ""
}

# nlb_listener
variable "http_listeners_port" {
  description = "http listener port for load balancer"
  type        = number
  default     = 0
}
variable "http_listeners_protocol" {
  description = "http listener protocol for load balancer"
  type        = string
  default     = ""
}
variable "http_listeners_target_group_index" {
  description = "http listener target group index for load balancer"
  type        = number
  default     = 0
}

#nlb_group
variable "target_groups_name_prefix" {
  description = "Name prefix of target groups"
  type        = string
  default     = ""
}
variable "target_groups_backend_protocol" {
  description = "backend protocol of target groups"
  type        = string
  default     = ""
}
variable "target_groups_backend_port" {
  description = "backend port of target groups"
  type        = number
  default     = 0
}
variable "target_type" {
  description = "target type"
  type        = string
  default     = ""
}

# access logs
variable "access_logs_bucket_name" {
  description = "Name of bucket"
  type        = string
  default     = ""
}
variable "access_logs_prefix" {
  description = "prefix of access logs"
  type        = string
  default     = ""
}
variable "access_logs_enabled" {
  description = "prefix of access logs"
  type        = bool
  default     = true
}



# autoscaling attachment
variable "autoscaling_group_name" {
  description = "Name of autoscaling group"
  type        = string
  default     = ""
}
variable "alb_target_group_arn" {
  description = "alb target group arn"
  type        = string
  default     = ""
}
