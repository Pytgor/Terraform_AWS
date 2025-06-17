module "database" {
  source = "./module/rds"

  project_name = "proj04-tf"
  credentials = {
    username = "db-admin"
    password = "abc234343"

  }
}