# VPC
output "vpc_name" {
  value = module.vpc.name
}
output "vpc_id" {
  value = module.vpc.vpc_id
}

# subnet
output "subnet_id" {
  value = [for subnet in aws_subnet.subnet : subnet.id]
}




