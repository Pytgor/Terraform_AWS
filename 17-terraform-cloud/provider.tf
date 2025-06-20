terraform {
  cloud {

    organization = "terraform-kour"

    workspaces {
      name = "terraform-cli"
    }
  }
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"

}