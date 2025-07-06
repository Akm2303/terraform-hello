provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_artifact_registry_repository" "registry" {
  location      = var.region
  repository_id = var.repository_akm
  format        = var.format

  docker_config {
    immutable_tags = false
  }

  description = "Artifact Registry via Terraform"
}

output "registry_url" {
  value = "${google_artifact_registry_repository.registry.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.registry.repository_id}"
}
