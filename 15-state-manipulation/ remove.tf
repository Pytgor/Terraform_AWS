/*
1. Remove via  CLI
2. Remove via the import block
*/


# remove {
#     from = aws_s3_bucket.remove_s3

#     lifecycle {
#         destroy = true
#     }
# }

resource "aws_s3_bucket" "remove_s3" {
    bucket = "random-name1232"

    tags = {
        Project = "s3"
        Madeby = "Moises"
    }
}

import {
    to = aws_s3_bucket.remove_s3
    id = "random-name1232"
}