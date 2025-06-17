####################
# Subnet Validation
####################

data "aws_vpc" "default" {
  default = true

}

data "aws_subnet" "from_subnets_ids" {
  for_each = toset(var.subnet_ids)
  id       = each.value


  lifecycle {
    postcondition {
      condition     = self.vpc_id != data.aws_vpc.default.id
      error_message = <<-EOT
        the following subnet is part ofthe default vpc 

        Name = ${self.tags.Name}
        ID = ${self.id}

        Please do not deploy rds instance in the default VPC


        EOT
    }
  }

}

#############################
# Security Group Validation
#############################