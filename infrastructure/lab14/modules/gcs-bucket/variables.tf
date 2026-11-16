variable "bucket_name" {
  description = "Unique name of the GCS bucket"
  type        = string
}

variable "location" {
  description = "GCS bucket location"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}
