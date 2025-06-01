locals {
  project_name = "12-public-modules"
  common_tags = {
    project   = local.project_name
    ManagedBy = "Terraform"
  }
}