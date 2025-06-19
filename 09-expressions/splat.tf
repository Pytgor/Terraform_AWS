locals {
  firstname_from_splat        = var.object_list[*].firstname
  roles_from_splat            = [for username, user_props in local.users_map2 : user_props.roles] # same result as same below but different way to type it
  roles_from_splat_with_value = values(local.users_map2)[*].roles
}

output "firstname_from_splat" {
  value = local.firstname_from_splat

}

output "roles_from_splat_for" {
  value = local.roles_from_splat

}
output "roles_from_splat_with_value" {
  value = local.roles_from_splat_with_value

}