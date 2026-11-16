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
  project = "terraform-learning-lab-514407"
  region  = "us-central1"
}

module "storage" {
  source = "../../modules/gcs-bucket"

  bucket_name = "terraform-learning-lab-514407-lab14-dev"
  environment = "dev"
  location    = "US-CENTRAL1"
}
