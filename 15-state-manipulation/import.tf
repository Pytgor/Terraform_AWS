/*
1. Import via  CLI
2. Import via the import block
*/


# resource "aws_s3_bucket" "bucket_receive" {
#   bucket = "bucket-replication3"

#   tags = {
#     Managedby = "terraform"
#     Lifeccycle = "Critical"
# }
  
#   lifecycle {
#     prevent_destroy = false # set to true to never destroy
#   }
# }

# import {
#   to = aws_s3_bucket_public_access_block.bucket_receive
#   id = aws_s3_bucket.bucket_receive.bucket
# }
# resource "aws_s3_bucket_public_access_block" "bucket_receive" {
#   bucket = aws_s3_bucket.bucket_receive.bucket

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true

# }