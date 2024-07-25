terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
  Hola = Hola.var
}
resource "aws_instance" "nginx-server" {
  ami           = "ami-0583d8c7a9c35822c"
  instance_type = "t2.nano"
}
