locals {
  project_id = trimprefix(var.project_id, "projects/")
}

resource "google_cloudbuild_trigger" "continuous-provisioning-trigger" {
  provider    = google-beta
  name        = replace(replace(lower(var.name), " ", "-"), "/[^a-z0-9\\-]/", "")
  description = var.description
  filename    = var.cloudbuild
  project     = local.project_id

  github {
    owner = var.owner
    name  = var.name

    push {
      branch = var.branch
    }
  }

  included_files = var.include
  substitutions  = var.substitutions
}
