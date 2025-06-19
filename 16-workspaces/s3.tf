resource "random_id" "bucket_suffix" {
  byte_length = 4

}

/*
int -> 1 bucket
Dev -> 1 bucket
Staging -> 2 buckets
Prod -> 3 buckets
*/

resource "aws_s3_bucket" "this" {
  count  = var.bucket_count
  bucket = "workspace-${terraform.workspace}-${count.index}-${random_id.bucket_suffix.hex}"

}