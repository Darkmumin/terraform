variable "access_key" {
  type        = string
  description = "Access Key for access to AWS"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  description = "Secret Key for access to AWS"
  sensitive   = true
}

variable "ami_id" {
  type        = string
  description = "AMI Id for deploy EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "EC2 instances type for deploy"
}

variable "server_name" {
  type        = set(string)
  description = "Server Name for deploy in EC2 instances"
}

variable "enviroment" {
  type        = string
  description = "Enviroment of the server"
}

variable "region" {
  type        = string
  description = "Region to deploy the EC2 instances"
}

