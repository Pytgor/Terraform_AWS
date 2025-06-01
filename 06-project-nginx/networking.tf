locals {
  common_tags = {
    Managedby  = "Terraform"
    Project    = "06-projects"
    Name       = "My-Project"
    costcenter = "1234"


  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = local.common_tags


}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = local.common_tags
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main.id

  tags = local.common_tags

}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id

  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rtb.id
}