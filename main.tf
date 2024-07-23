provider "google" {
  project = "round-dispatch-430323-g2"
  region  = "us-central1"
}

variable "project_id" {
  default = "round-dispatch-430323-g2"
}


resource "google_artifact_registry_repository" "my_repo" {
  provider      = google
  format        = "DOCKER"
  location      = "us-central1"
  repository_id = "my-repo"
}

resource "google_cloud_run_service" "hello_world" {
  name     = "hello-world"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/${google_artifact_registry_repository.my_repo.project}/${google_artifact_registry_repository.my_repo.repository_id}/hello-world:latest"
        resources {
          limits = {
            memory = "512Mi"
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_project_iam_member" "run_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "allUsers"

  depends_on = [
    google_cloud_run_service.hello_world
  ]
}

