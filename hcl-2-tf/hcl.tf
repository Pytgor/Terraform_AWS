terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

# this is manage by us,  by our terraform projects
resource "aws_s3_bucket" "myS3kour" {
  bucket = "mybucketS3"

}

# Managed somewhere else, we just want to use in our project
data "aws_s3_bucket" "my_external_bucket" {

  bucket = var.bucket_name
}

variable "bucket_name" {
  type        = string
  description = " Use to set bucket name"
  default     = "default_bucket_name"
}

output "bucket_id" {
  value = aws_s3_bucket.myS3kour.id

}

# Create temporary variable

locals {
  local_example = "This is a variable"

}

module "my_module" {
  source = "./module-example"

}