#VPC
variable "vpc_name" {
  description = "Name of vpc"
  type        = string
  default     = ""
}
variable "vpc_cidr" {
  description = "cidr"
  type        = string
  default     = ""
}
variable "vpc_enable_dns_hostnames" {
  description = "enable_dns_hostnames"
  type        = bool
  default     = true
}
variable "vpc_manage_default_route_table" {
  description = "manage default route table"
  type        = bool
  default     = true
}
variable "vpc_default_route_table_name" {
  description = "default route table name"
  type        = string
  default     = ""
}
variable "vpc_default_route_table_routes_cidr_block" {
  description = "vpc default route table routes cidr block"
  type        = string
  default     = ""
}

#SUBNET
variable "subnet_name" {
  description = "Name of subnet"
  type        = list(string)
  default     = []
}
variable "subnet_cidr_block" {
  description = "subnet cidr block"
  type        = list(string)
  default     = []
}
variable "subnet_availability_zone" {
  description = "subnet availability zone"
  type        = list(string)
  default     = []
}
variable "subnet_map_public_ip_on_launch" {
  description = "subnet map public ip on launch"
  type        = bool
  default     = false
}

#internet_gateway
variable "igw_name" {
  type = string
}



#security group rules1
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







