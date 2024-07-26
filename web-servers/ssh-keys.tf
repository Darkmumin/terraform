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