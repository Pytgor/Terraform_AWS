terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}

provider "aws" {
  region = "us-east-2"
  alias  = "us-easttwo"

}

resource "aws_s3_bucket" "eu-east-1" {
  bucket = "bucket-05one"

}

resource "aws_s3_bucket" "us_east-2" {
  bucket   = "bucket-05-two"
  provider = aws.us-easttwo

}