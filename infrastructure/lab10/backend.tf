terraform {
  backend "gcs" {
    bucket = "terraform-learning-lab-514407-tfstate"
    prefix = "terraform-lab10"
  }
}