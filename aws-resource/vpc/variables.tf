# VPC
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
  description = "enable dns hostnames"
  type        = bool
  default     = true
}
variable "vpc_enable_nat_gateway" {
  description = "vpc enable nat gateway"
  type        = bool
  default     = true
}
variable "vpc_single_nat_gateway" {
  description = "vpc single nat gateway"
  type        = bool
  default     = true
}
variable "vpc_one_nat_gateway_per_az" {
  description = "vpc one nat gateway per az"
  type        = bool
  default     = false
}

# subnet for vpc
variable "subnet_map_public_ip_on_launch" {
  description = "subnet map public ip on launch"
  type        = bool
  default     = false
}
variable "vpc_azs" {
  type = list(string)
}
variable "vpc_private_subnets" {
  type = list(string)
}
variable "vpc_public_subnets" {
  type = list(string)
}
# subnet for database 
variable "vpc_create_database_subnet_group" {
  type    = bool
  default = false
}
variable "vpc_database_subnets" {
  type = list(string)
}




# security group rules ingress
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

# security group rules egress
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
