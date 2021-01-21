terraform {
  backend "gcs" {
    bucket = "prod-open-restaurant-0c8b987e-europe-west2-state"
    prefix = "website"
  }
}
