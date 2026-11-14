terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
}

resource "google_storage_bucket" "lab10_bucket" {
  name                        = "${var.project_id}-lab10-dev"
  location                    = "US-CENTRAL1"
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  labels = {
    environment = "dev"
    managed_by  = "terraform"
    deployment  = "github-actions"
  }
}