variable "eks" {
  type = map(any)
}
variable "eks_subnet_ids" {
  type = list(string)
}
variable "default_manage_node" {
  type = map(any)
}
variable "manage_node_group" {
  type = map(any)
}

variable "my_lb" {
  type = map(any)
}
variable "lb_subnet_ids" {
  type = list(string)
}
variable "http_listeners" {
  type = map(any)
}
variable "target_groups" {
  type = map(any)
}
variable "access_logs" {
  type = map(any)
}


variable "rds" {
  type = map(any)
}
variable "subnet_name" {
  type = list(string)
}
variable "subnet_cidr_block" {
  type = list(string)
}
variable "subnet_availability_zone" {
  type = list(string)
}
variable "subnet_map_public_ip_on_launch" {
  type = string
}
