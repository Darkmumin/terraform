output "instance_ip_private_addr" {
  # value       = aws_instance.nginx-server-aws.private_ip
  value       = { for service, i in aws_instance.server-aws : service => i.private_ip }
  description = "Ip Privada de mi server"
}

output "instance_ip_public_addr" {
  # value       = aws_instance.nginx-server-aws.public_ip
  value       = { for service, i in aws_instance.server-aws : service => i.public_ip }
  description = "Ip Publica de mi server"
}

output "server-id" {
  # value       = aws_instance.nginx-server-aws.id
  value       = { for service, i in aws_instance.server-aws : service => i.id }
  description = "id de mi server"
}

output "dns-name" {
  # value       = aws_instance.nginx-server-aws.public_dns
  value       = { for service, i in aws_instance.server-aws : service => i.public_dns }
  description = "nombre de mi server"
}


