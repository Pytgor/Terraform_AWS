resource "random_id" "this" {
  byte_length = 4

}

resource "aws_s3_bucket" "this" {
  bucket = "terraform-cloud-test-${random_id.this.hex}"

}