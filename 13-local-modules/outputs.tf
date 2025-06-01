output "module_vpc_id" {
  description = "The ID and availability zone of public subnets"
  value       = module.vpc.vpc_id

}



output "module_public_subnets" {
  value = module.vpc.public_subnets

}



output "module_private_subnets" {
  value = module.vpc.private_subnets

}