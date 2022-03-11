


variable "vpc" {
  type = object({
    vpc_name                         = string
    vpc_cidr                         = string
    vpc_list                         = map(list(string))
  })
}

# RDS
variable "rds" {
  type = map(any)
}


# update-kubeconfig
variable "update-kubeconfig" {
  type = string
}


# provider-aws
variable "profile" {
  type = string
}
variable "region" {
  type = string
}
