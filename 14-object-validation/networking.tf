data "aws_vpc" "default" {
  default = true
}
data "aws_availability_zones" "azs" {
  state = "available"

}

resource "aws_subnet" "this" {
  count      = 2
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.${128 + count.index}.0/24"
  availability_zone = data.aws_availability_zones.azs.names[
    count.index % length(data.aws_availability_zones.azs.names)
  ]


  lifecycle {
    postcondition {
      condition     = contains(data.aws_availability_zones.azs.names, self.availability_zone)
      error_message = "Invalid AZ"

    }
  }
}

check "high_availability_check" {
  assert {
    condition     = length(toset([for subnet in aws_subnet.this : subnet.availability_zone])) > 1
    error_message = "You are deploying all subnets within same AZ. Please distribute them amoung difference az"
  }

}