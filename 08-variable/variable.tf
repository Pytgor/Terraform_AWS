variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of managed EC2 instances"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "Only support any thing starting with t3"

  }
}



# variable "ec2_volume_size" {
#   type        = number
#   description = "The size of the root block volume attached to my ec2"

# }

# variable "ec2_volume_type" {
#   type        = string
#   description = "The type of volume between gp2/gp3"

# }

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })

  description = "The size and type of the root block volume for EC2 instances"

  default = {
    size = 10
    type = "gp3"
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}


variable "my_sensitive_value" {
  type      = string
  sensitive = true
}