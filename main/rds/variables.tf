#RDS
variable "rds_identifier" {
  description = "identifier of rds"
  type        = string
  default     = ""
}
variable "rds_engine" {
  description = "engine of rds"
  type        = string
  default     = ""
}
variable "rds_engine_version" {
  description = "engine version of rds"
  type        = string
  default     = ""
}

variable "rds_instance_class" {
  description = "instace class of rds"
  type        = string
  default     = ""
}
variable "rds_allocated_storage" {
  description = "number of storage"
  type        = number
  default     = 0
}
variable "rds_max_allocated_storage" {
  description = "maximum number of storage"
  type        = number
  default     = 0
}
variable "rds_name" {
  description = "name of database"
  type        = string
  default     = ""
}
variable "rds_username" {
  description = "username of database"
  type        = string
  default     = ""
}
variable "rds_password" {
  description = "password of database"
  type        = string
  default     = ""
}
variable "rds_port" {
  description = "port of database server"
  type        = string
  default     = ""
}
variable "rds_iam_database_authentication_enabled" {
  description = "database authentication enabled"
  type        = bool
  default     = false
}

# variable "security_group_ids" {
#   description = "A list security group id"
#   type        = string
#   default     = ""
# }

variable "rds_monitoring_interval" {
  description = "monitoring interval time"
  type        = string
  default     = ""
}
variable "rds_monitoring_role_name" {
  description = "monitoring role name"
  type        = string
  default     = ""
}
variable "rds_create_monitoring_role" {
  description = "engine version of rds"
  type        = bool
  default     = true
}
variable "rds_create_db_subnet_group" {
  description = "subnet group create"
  type        = bool
  default     = true
}
variable "db_subnet_group_name" {
  description = "subnet group name"
  type        = string
  default     = ""
}
variable "db_subnet_group_use_name_prefix" {
  description = "subnet group use prefix name"
  type        = bool
  default     = false
}
variable "db_subnet_group_description" {
  description = "subnet group description"
  type        = string
  default     = ""
}
# variable "subnet_ids" {
#   description = "ID of subnet"
#   type        = list(string)
#   default     = []
# }
variable "family" {
  description = "family"
  type        = string
  default     = ""
}
variable "backup_retention_period" {
  description = "backup retention period"
  type        = number
  default     = 0
}
# variable "performance_insights_enabled" {
#   description = "performance insights enabled"
#   type        = bool
#   default     = true
# }
# variable "performance_insights_kms_key_id" {
#   description = "performance insights kms key id"
#   type        = string
#   default     = ""
# }
# variable "performance_insights_retention_period" {
#   description = "performance insights retention period"
#   type        = number
#   default     = 0
# }
variable "skip_final_snapshot" {
  description = " skip final snapshot"
  type        = bool
  default     = true
}

#rds security group
variable "security_group_name" {
  description = "security group name"
  type        = string
  default     = ""
}
variable "security_group_use_name_prefix" {
  description = "security group use name prefix"
  type        = bool
  default     = false
}
variable "security_group_description" {
  description = "security group description"
  type        = string
  default     = ""
}

variable "security_group_cidr_from_port" {
  description = "security group ingress cidr from port"
  type        = number
  default     = 0
}
variable "security_group_cidr_to_port" {
  description = "security group ingress cidr to port"
  type        = number
  default     = 0
}
variable "security_group_cidr_protocol" {
  description = "security group ingress cidr protocol"
  type        = string
  default     = ""
}
variable "security_group_cidr_description" {
  description = "security group ingress cidr description"
  type        = string
  default     = ""
}
variable "security_group_cidr_block" {
  description = "security group ingress cidr block"
  type        = string
  default     = ""
}

#rds subnet
variable "subnet_name" {
  description = "Name of subnet"
  type        = list(string)
  default     = []
}
variable "vpc_id" {
  description = "vpc id"
  type        = string
  default     = ""
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
  description = "vpc id"
  type        = bool
  default     = false
}
