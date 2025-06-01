locals {
  double_map = { for key, value in var.number_map : key => value * 2 }
  even_map   = { for key, value in var.number_map : key => value * 2 if value % 2 == 0 }
}

output "doubleMap" {
  value = local.double_map
}

output "evenMap" {
  value = local.even_map
}