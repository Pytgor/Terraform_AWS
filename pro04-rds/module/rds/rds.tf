locals {
  db_engine = {
    postgres = {
      engine  = "postgres"
      version = "13.17"
      family  = "postgres13"
    }

    postgres-12 = {
      engine  = "postgres"
      version = "12.22"
      family  = "postgres12"

    }
  }
}
resource "aws_db_subnet_group" "this" {
  name       = var.project_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.project_name

  }

}



resource "aws_db_parameter_group" "this" {
  name   = var.project_name
  family = local.db_engine[var.engine].family

  parameter {
    name  = "log_connections"
    value = "1"
  }

}

resource "aws_db_instance" "this" {
  identifier           = var.project_name
  instance_class       = var.instance_type
  allocated_storage    = var.storage_size
  engine               = local.db_engine[var.engine].engine
  engine_version       = local.db_engine[var.engine].version
  username             = var.credentials.username
  password             = var.credentials.password
  db_subnet_group_name = aws_db_subnet_group.this.name
  publicly_accessible  = false
  skip_final_snapshot  = true


}