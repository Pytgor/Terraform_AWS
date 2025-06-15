module "database" {
  source = "./module/rds"

  project_name = "hashicorp/aws"
  credentials = {
    username = "db-admin"
    password = "1234abvd"
  }

}