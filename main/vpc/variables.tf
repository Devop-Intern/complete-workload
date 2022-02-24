#NLB
# variable "lb_version" {
#   description = "Version of network load balancer"
#   type        = string
#   default     = ""
# }
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

#access logs
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

#autoscaling attachment
variable "autoscaling_group_name" {
  description = "Name of autoscaling group"
  type        = string
  default     = ""
}

#security group rules
variable "security_group_rule_type" {
  description = "Type of security group rule"
  type        = string
  default     = ""
}
variable "security_group_rule_description" {
  description = "Description of security group rule"
  type        = string
  default     = ""
}
variable "security_group_rule_form_port" {
  description = "Access from port of security group rule"
  type        = number
  default     = 0
}
variable "security_group_rule_to_port" {
  description = "Access to port of security group rule"
  type        = number
  default     = 0
}
variable "security_group_rule_protocol" {
  description = "Protocol of security group rule"
  type        = string
  default     = ""
}
variable "security_group_id" {
  description = "ID of security group"
  type        = string
  default     = ""
}
variable "security_group_rule_cidr_blocks" {
  description = "cidr blocks of security group rule"
  type        = list(string)
  default     = []
}

#security group rules2
variable "security_group_rule_type2" {
  description = "Type of security group rule"
  type        = string
  default     = ""
}
variable "security_group_rule_description2" {
  description = "Description of security group rule"
  type        = string
  default     = ""
}
variable "security_group_rule_form_port2" {
  description = "Access from port of security group rule"
  type        = number
  default     = 0
}
variable "security_group_rule_to_port2" {
  description = "Access to port of security group rule"
  type        = number
  default     = 0
}
variable "security_group_rule_protocol2" {
  description = "Protocol of security group rule"
  type        = string
  default     = ""
}
variable "security_group_id2" {
  description = "ID of security group"
  type        = string
  default     = ""
}
variable "security_group_rule_cidr_blocks2" {
  description = "cidr blocks of security group rule"
  type        = list(string)
  default     = []
}




