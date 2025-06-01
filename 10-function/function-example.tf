locals {
  name = "Marcos Rodriguez"
  age  = 20
  my_object = {
    key1 = 10
    key2 = "key2 value"
  }
}

output "example" {
  value = startswith(lower(local.name), "marcos")

}

output "example-2" {
  value = pow(local.age, 2)

}
output "example-3" {
  value = yamldecode(file("${path.module}/users.yaml")).users[*].name

}

output "example-4" {
  value = jsonencode(local.my_object)

}