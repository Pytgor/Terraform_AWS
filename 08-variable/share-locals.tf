locals {
  project       = "08-project"
  project_owner = "terraform-course"
  cost_center   = "1234"
  managed_by    = "terraform"
}

locals {
  common_tags = {
    project       = local.project
    owner         = local.project_owner
    cost_center   = local.cost_center
    managedby     = local.managed_by
    sensitive_tag = var.my_sensitive_value
  }
}