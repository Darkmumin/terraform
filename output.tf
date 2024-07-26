output "private_IP_PROD" {
  description = "The ip private of EC2 instance"
  # value = { for service, i in module.nginx-servers-prod.private_ip : service => i.private_ip }
  value = module.nginx-servers-prod.instance_ip_private_addr
}

output "private_IP_DEV" {
  description = "The ip private of EC2 instance"
  # value = { for service, i in module.nginx-servers-prod.private_ip : service => i.private_ip }
  value = module.nginx-servers-dev.instance_ip_private_addr
}

output "public_IP_PROD" {
  description = "The ip public of EC2 instance"
  # value = { for service, i in module.nginx-servers-prod.private_ip : service => i.private_ip }
  value = module.nginx-servers-prod.instance_ip_public_addr
}

output "public_IP_DEV" {
  description = "The ip public of EC2 instance"
  # value = { for service, i in module.nginx-servers-prod.private_ip : service => i.private_ip }
  value = module.nginx-servers-dev.instance_ip_public_addr
}

output "dns_PROD" {
  description = "The ip public of EC2 instance"
  # value = { for service, i in module.nginx-servers-prod.private_ip : service => i.private_ip }
  value = module.nginx-servers-prod.dns-name
}

output "dns_DEV" {
  description = "The ip public of EC2 instance"
  # value = { for service, i in module.nginx-servers-prod.private_ip : service => i.private_ip }
  value = module.nginx-servers-dev.dns-name
}

output "id_PROD" {
  description = "The ip public of EC2 instance"
  # value = { for service, i in module.nginx-servers-prod.private_ip : service => i.private_ip }
  value = module.nginx-servers-prod.server-id
}

output "id_DEV" {
  description = "The ip public of EC2 instance"
  # value = { for service, i in module.nginx-servers-prod.private_ip : service => i.private_ip }
  value = module.nginx-servers-dev.server-id
}