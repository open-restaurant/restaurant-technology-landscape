output "name_servers" {
  value = module.website_stack.name_servers
}

output "website_ip_address" {
  value = module.website_stack.ip_address
}

output "website_domain_name" {
  value = module.website_stack.domain_name
}
