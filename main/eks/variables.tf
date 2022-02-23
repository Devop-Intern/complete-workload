#EKS
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

#EKS managed node group
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

# security group rule
variable "scgr_type" {
  description = "Type of security group rule"
  type        = string
  default     = ""
}
variable "scgr_description" {
  description = "Description of security group rule"
  type        = string
  default     = ""
}
variable "scgr_form_port" {
  description = "Access from port of security group rule"
  type        = number
  default     = 0
}
variable "scgr_to_port" {
  description = "Access to port of security group rule"
  type        = number
  default     = 0
}
variable "scgr_protocol" {
  description = "Protocol of security group rule"
  type        = string
  default     = ""
}
variable "scgr_cidr_blocks" {
  description = "cidr blocks of security group rule"
  type        = list(string)
  default     = []
}

