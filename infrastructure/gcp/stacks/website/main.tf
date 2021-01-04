locals {
  description  = "Restaurant Technology Landscape"
  domain       = "open.restaurant"
  website_name = "restaurant-technology-landscape"
}

# DNS Manage Zone
resource "google_dns_managed_zone" "website_zone" {
  name        = "${local.website_name}-zone"
  dns_name    = "${local.domain}."
  description = local.description
}
# Create Website
module "website" {
  source      = "../../modules/website"
  name        = local.website_name
  description = local.description
  domain      = "${var.subdomain}.${local.domain}"
  zone        = google_dns_managed_zone.website_zone
  region      = var.region
}
# Create Cloud Build trigger
module "cloudbuild_for_website" {
  source      = "../../modules/trigger"
  branch      = var.branch
  description = local.description
  name        = local.website_name
  project_id  = var.project

  cloudbuild = "website/cloudbuild.yaml"
  owner      = "open-restaurant"
  repository = "restaurant-technology-landscape"
  include    = ["website/**"]
  substitutions = {
    _BUCKET_NAME : module.website.bucket_url,
  }
}
