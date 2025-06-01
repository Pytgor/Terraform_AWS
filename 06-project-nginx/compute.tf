resource "aws_instance" "web" {
  ami                         = "ami-0ba792d9171fc8cae"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.public_http.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"

    tags = local.common_tags
  }
  
  lifecycle {
    create_before_destroy = true
}

}


resource "aws_security_group" "public_http" {
  description = "Security group to allow traffic on port 443 and 80"
  name        = "public-traffic"
  vpc_id      = aws_vpc.main.id

  tags = local.common_tags
}
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80    
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}