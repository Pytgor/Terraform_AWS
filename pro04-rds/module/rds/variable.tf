variable "project_name" {
  type = string

}

variable "instance_type" {
  type    = string
  default = "db.t3.micro"

  validation {
    condition     = contains(["db.t3.micro"], var.instance_type)
    error_message = "Only db.t3.micro is allowed due to free tier access"
  }
}

variable "storage_size" {
  type    = number
  default = 10

  validation {
    condition     = var.storage_size > 5 && var.storage_size < 20
    error_message = "Storage need to be between 5GB and 20GB due to free tier"
  }

}

variable "engine" {
  type    = string
  default = "postgres-latest"
  validation {
    condition     = contains(["postgres-lastest", "postgres-14"], var.engine)
    error_message = "DB engine need to be postgress or mysql "
  }

}


variable "credentials" {
  type = object({
    username = string
    password = string

  })
  sensitive = true

  validation {
    condition = (
      length(var.credentials.password) >= 6 &&
      length(regexall("[a-zA-Z]", var.credentials.password)) > 0 &&
      length(regexall("[0-9]", var.credentials.password)) > 0
    )
    error_message = "password must contains at least 1 character and 1 digit, and be 8 character long "

  }


}