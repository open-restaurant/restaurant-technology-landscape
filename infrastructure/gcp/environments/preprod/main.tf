provider "google" {
  alias = "token"
}

data "google_service_account_access_token" "default" {
  provider               = google.token
  target_service_account = "terraform@${var.project}.iam.gserviceaccount.com"
  scopes                 = ["cloud-platform"]
  lifetime               = "1200s"
}

provider "google" {
  project      = var.project
  region       = var.region
  access_token = data.google_service_account_access_token.default.access_token
}

module "website_stack" {
  source    = "../../stacks/website"
  branch    = var.branch
  project   = var.project
  region    = var.region
  subdomain = var.subdomain
}
