locals {
  users_from_yaml = yamldecode(file("${path.module}/users-roles.yaml")).users
  users_map = {
    for user_config in local.users_from_yaml : user_config.username => user_config.roles
  }

}




resource "aws_iam_user" "users" {
  for_each = toset(local.users_from_yaml[*].username)
  name     = each.value

}

resource "aws_iam_user_login_profile" "users" {
  for_each        = aws_iam_user.users
  user            = each.value.name
  password_length = 8

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key
    ]
  }


}





output "users" {
  value = local.users_from_yaml

}

output "password" {
  sensitive = true
  value     = { for user, user_loging in aws_iam_user_login_profile.users : user => user_loging.password }
}
