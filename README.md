# Enterprise Terraform CI/CD Platform on Google Cloud

## Project Overview

A multi-environment infrastructure automation platform built using Terraform, Google Cloud Platform, and GitHub Actions. This project demonstrates secure infrastructure provisioning, automated deployments, environment promotion, and post-deployment security validation.

## Technology Stack

- Google Cloud Platform (GCP)
- Terraform
- GitHub Actions
- Workload Identity Federation
- Google Cloud Storage
- IAM and Service Accounts
- Bash Scripting
- jq

## Platform Capabilities

- Reusable Terraform infrastructure modules.
- Independent DEV and UAT environments.
- Remote Terraform state management using GCS.
- Keyless authentication using Workload Identity Federation.
- Separate Terraform Plan and Apply service accounts.
- Manual deployment approval gates.
- Saved Terraform plan artifacts.
- Automated post-deployment smoke testing.
- Environment promotion quality gates.

## Deployment Architecture

Developer → Pull Request → CI Validation → Merge → DEV Plan → DEV Approval → DEV Apply → DEV Smoke Test → UAT Plan → UAT Approval → UAT Apply → UAT Smoke Test

## Lab 15 — Automated Post-Deployment Validation

Implemented a reusable Bash validation script that retrieves GCP bucket metadata in JSON format and validates infrastructure configuration using jq.

### Validation Checks

| Check | Expected Result |
|---|---|
| Environment label | Matches target environment |
| Deployment tracking | github-actions |
| Public access prevention | enforced |
| Uniform bucket-level access | true |

### Test Results

**Positive Test:** All six deployment jobs completed successfully across DEV and UAT.

**Negative Test:** Simulated a DEV validation failure and verified that all three UAT jobs were automatically skipped.

The failure simulation does not modify actual cloud infrastructure or weaken security configurations.

## Upcoming Enhancements

- Automated infrastructure drift detection.
- Terraform rollback and recovery.
- Branch protection and deployment governance.
- Dedicated production environment.
- Containerized application deployments.
- Kubernetes and GitOps integration.
- Monitoring and observability.
