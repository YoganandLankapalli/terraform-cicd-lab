terraform {
  required_version = ">= 1.5.0"
}

locals {
project_name="terraform-cicd-lab"
environment="dev"
}

output "project_info" {
  value = "${local.project_name}-${local.environment}"
}