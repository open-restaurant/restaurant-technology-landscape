output "name_servers" {
  value = google_dns_managed_zone.website_zone.name_servers
}

output "ip_address" {
  value = module.website.site_ip_address
}

output "domain_name" {
  value = module.website.site_domain_name
}
