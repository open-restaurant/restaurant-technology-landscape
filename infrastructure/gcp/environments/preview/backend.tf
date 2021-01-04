terraform {
  backend "gcs" {
    bucket = "preview-open-restaura-a6f67728-europe-west2-state"
    prefix = "website"
  }
}
