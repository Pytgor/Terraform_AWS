<!-- # Networking Module

This module managed the creation of vpc and subnet allow for the creation of both private and public subnets.

Example usage:


<!-- 
module "vpc" {
  source = "./modules/networking"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "your_vpc"
  }
  subnet_config = {
    subnet-1 = {
      cidr_block = "10.0.0.0/24"
      public = true
      az         = "us-east-1a"
    }
    subnet-2 = {
      cidr_block = "10.0.1.0/24"
      public     = true
      az         = "us-east-1b"
    }
  }


  
} --> 
