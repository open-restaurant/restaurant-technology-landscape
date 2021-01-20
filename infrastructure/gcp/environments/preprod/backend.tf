terraform {
  backend "gcs" {
    bucket = "preprod-open-restaura-16b430e6-europe-west2-state"
    prefix = "website"
  }
}
