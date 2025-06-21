variable "terraform_cloud_url" {
  type    = string
  default = "app.terraform.io"
}

variable "terraform_cloud_audience" {
  type        = string
  default     = "aws.workload.identity"
  description = "The audience use for terraform cloud"
}


variable "terraform_cloud_thumbprint_list" {
  type        = string
  default     = "06b25927c42a721631c1efd9431e648fa62e1e39"
  description = "Thumblist from my identity provider "
}

variable "admin_role_workspaces" {
  type        = list(string)
  description = "All workspaces can assume the terraform-cloud-admin role"
}

variable "project_name" {
  type        = string
  description = "All project name can assume the terraform-cloud-admin role"

}