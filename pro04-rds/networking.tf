
#############################
# VPC & Subnets
#############################

data "aws_vpc" "default" {
  default = true

}

resource "aws_vpc" "custom" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "pro04-custom"
  }

}

moved {
  from = aws_subnet.allowed
  to   = aws_subnet.private1
}
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name   = "Subnet-custom-vpc-1"
    Access = "private"
  }

}
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name   = "Subnet-custom-vpc-2"
    Access = "private"
  }

}
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Subnet-custom-public-vpc"

  }

}

# For documentation not use.

resource "aws_subnet" "not_allowed" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.128.0/24"

  tags = {
    Name = "Subnet-not-allowed"
  }

}

#############################
# Security Groups
#############################

# 1. Source security group from where traffic is allowed
# 2. Compliant security group
# 3. Non-compliant security group
#   3.1 Security group rule 

resource "aws_security_group" "source" {
  name        = "source-sg"
  description = "SG from where connections are allowed into the DB"
  vpc_id      = aws_vpc.custom.id

}

resource "aws_security_group" "compliant" {
  name        = "compliant-sg"
  description = "Complinat security group"
  vpc_id      = aws_vpc.custom.id

}

resource "aws_vpc_security_group_ingress_rule" "db" {
  security_group_id            = aws_security_group.compliant.id
  referenced_security_group_id = aws_security_group.source.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"

}
resource "aws_security_group" "non_compliant" {
  name        = "non-compliant-sg"
  description = "SG from where connections are allowed into the DB"
  vpc_id      = aws_vpc.custom.id

}


resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.non_compliant.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"

}