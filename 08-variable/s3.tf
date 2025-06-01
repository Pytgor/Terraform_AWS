resource "random_id" "s3_id" {
  byte_length = 4

}

resource "aws_s3_bucket" "project_bucket" {
  bucket = "${local.project}-${random_id.s3_id.hex}"

  tags = merge(local.common_tags, var.additional_tags)

}