variable "ec2_instance_type" {
  type        = string
  description = "The ec2 that will be created via terraform cloud"

  validation {
    condition     = var.ec2_instance_type == "t2.micro"
    error_message = "Only use the t2.micro to be under free tier"
  }
}