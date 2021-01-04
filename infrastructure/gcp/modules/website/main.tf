resource "google_storage_bucket" "static_site_bucket" {
  name          = "${var.name}-website"
  force_destroy = true
  location      = var.region

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.static_site_bucket.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_compute_backend_bucket" "static_site_backend" {
  name        = var.name
  description = var.description
  bucket_name = google_storage_bucket.static_site_bucket.name
  enable_cdn  = true
}

resource "random_id" "url_signature" {
  byte_length = 16
}

resource "google_compute_backend_bucket_signed_url_key" "static_site_backend_key" {
  name           = "${var.name}-key"
  key_value      = random_id.url_signature.b64_url
  backend_bucket = google_compute_backend_bucket.static_site_backend.name
}

resource "google_compute_url_map" "static_site_urlmap" {
  name            = "${var.name}-urlmap"
  description     = var.description
  default_service = google_compute_backend_bucket.static_site_backend.id

  host_rule {
    hosts        = [var.domain]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_bucket.static_site_backend.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_bucket.static_site_backend.id
    }
  }

  test {
    service = google_compute_backend_bucket.static_site_backend.id
    host    = var.domain
    path    = "/="
  }
}

resource "google_compute_target_http_proxy" "default" {
  name        = "${var.name}-proxy"
  url_map     = google_compute_url_map.static_site_urlmap.id
  description = var.description
}

resource "google_compute_global_forwarding_rule" "default" {
  name        = "global-rule"
  target      = google_compute_target_http_proxy.default.id
  port_range  = "80"
  description = var.description
}

resource "google_dns_record_set" "recordset" {
  name = "${var.domain}."
  type = "A"
  ttl  = 300

  managed_zone = var.zone.name

  rrdatas = [google_compute_global_forwarding_rule.default.ip_address]
}
