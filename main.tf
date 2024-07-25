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
}
resource "aws_instance" "nginx-server-aws" {
  ami                    = "ami-0583d8c7a9c35822c"
  instance_type          = "t2.micro"
  user_data              = <<-EOF
              # !/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF
  key_name               = aws_key_pair.nginx-server-aws-ssh.key_name
  vpc_security_group_ids = [aws_security_group.nginx-server-aws-sg.id]
  tags = {
    Name = "EC2-nginx-server-aws"
  }
}

resource "aws_key_pair" "nginx-server-aws-ssh" {
  key_name   = "nginx-server-aws-ssh"
  public_key = file("/root/nginx-server-aws.key.pub")
}

resource "aws_security_group" "nginx-server-aws-sg" {
  name        = "nginx-server-aws-sg"
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
}