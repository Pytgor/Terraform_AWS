terraform {
  required_version = ">=1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 5.0 "
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0 "
    }
  }
}


#AMI "ami-0b529f3487c2c0e7f" from us-east-1
provider "aws" {
  region = "us-east-1"
}