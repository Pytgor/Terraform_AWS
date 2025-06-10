/*
1. Terraform state mv ARG....
*/


locals {
  ec2_names = ["instance1", "instance2"]
}

data "aws_ami" "ubuntu" {

  most_recent = true
  owners      = ["099720109477"] # Owner is canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "new_final" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}

module "compute" {
  source = "./module/compute"
  ami_id = data.aws_ami.ubuntu.id

}