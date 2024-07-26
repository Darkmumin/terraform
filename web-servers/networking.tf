module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = "darkmumin-terraform-vpc"
    cidr = "10.0.0.0/16"
    azs = ["us-east-1a" , "us-east-1b"]
    public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
    enable_vpn_gateway = true
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Terraform = "verdadero"
        enviroment = "desarrollo"
    }
}

module "terraform-sg" {
    source = "terraform-aws-modules/security-group/aws"
    name = "http rule"
    description = "SG para habilitar HTTP"
    vpc_id = module.vpc.vpc_id
    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules = ["https-443-tcp"]
    egress_cidr_blocks = ["0.0.0.0/0"]
    egress_rules =["https-443-tcp"]
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