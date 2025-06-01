
#TF_VAR instance type = "t3.small"
# terraform.tfvars = "t3.small"
# prod.auto.tfvars = "t3.large"
#-var cli argument = "t3.xlarge"

ec2_instance_type = "t2.micro"

ec2_volume_config = {
  size = 10
  type = "gp2"
}

additional_tags = {
  "ValueFrom" = "terraform.tfvars"
}