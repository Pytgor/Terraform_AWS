terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>4.1.0"
    }
  }
  cloud {

    organization = "terraform-kour"

    workspaces {
      name = "terraform-cli-cloud"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}