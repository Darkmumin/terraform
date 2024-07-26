module "nginx-servers-prod" {
  source        = "./web-servers"
  secret_key    = var.secret_key
  access_key    = var.access_key
  ami_id        = var.ami_id
  instance_type = var.instance_type
  region        = var.region
  enviroment    = var.enviroment
  server_name   = var.server_name
}

module "nginx-servers-dev" {
  source        = "./web-servers"
  secret_key    = var.secret_key
  access_key    = var.access_key
  ami_id        = var.ami_id_dev
  instance_type = var.instance_type
  region        = var.region
  enviroment    = var.enviroment_dev
  server_name   = var.server_name_dev
}