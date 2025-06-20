resource "aws_s3_bucket" "this" {
  bucket = "terraform-cloud-${random_id.this.hex}"

  tags = {
    CreatedBy = "Terraform Cloud"
  }
}