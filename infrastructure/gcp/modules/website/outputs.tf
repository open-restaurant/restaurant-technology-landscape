output "bucket_url" {
  value = google_storage_bucket.static_site_bucket.url
}

output "site_ip_address" {
  value = google_compute_global_forwarding_rule.default.ip_address
}
