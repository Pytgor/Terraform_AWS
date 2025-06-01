locals {
  users_map = { for user_info in var.users : user_info.username => user_info.role # this convert object to list
  }

  users_map2 = {
    for username, roles in local.users_map : username => {
      roles = roles
    }
  }
  username_from_map = [for username, roles in local.users_map : username] # this converti map to list object
}


output "users_map" {
  value = local.users_map

}

output "users_map2" {
  value = local.users_map2

}

output "user_to_output_roles" {
  value = local.users_map2[var.user_to_output].roles

}
output "username_from_map" {
  value = local.username_from_map

}



