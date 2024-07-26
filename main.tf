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

resource "aws_key_pair" "server-aws-ssh" {
  for_each   = var.server_name
  key_name   = "${each.key}-ssh"
  public_key = file("/root/keys/${each.key}.key.pub")
  tags = {
    Name       = "${each.key}-ssh"
    Enviroment = var.enviroment
    Owner      = "edinson.rodriguez@wom.co"
    Team       = "DevOps"
    Project    = "Laboratorio"
  }
}

resource "aws_security_group" "server-aws-sg" {
  name        = "server-aws-sg"
  description = "Security group allowing SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "server-aws-sg"
    Enviroment = var.enviroment
    Owner      = "edinson.rodriguez@wom.co"
    Team       = "DevOps"
    Project    = "Laboratorio"
  }
}