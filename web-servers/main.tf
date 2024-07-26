terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
resource "aws_instance" "server-aws" {
  for_each               = var.server_name
  ami                    = var.ami_id
  instance_type          = var.instance_type
  user_data              = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              sudo dnf update -y
              sudo shutdown -r now
              EOF
  key_name               = aws_key_pair.server-aws-ssh[each.key].key_name
  vpc_security_group_ids = [aws_security_group.server-aws-sg.id]
  tags = {
    Name       = "EC2-${each.key}"
    Enviroment = var.enviroment
    Owner      = "edinson.rodriguez@wom.co"
    Team       = "DevOps"
    Project    = "Laboratorio"
  }
}



