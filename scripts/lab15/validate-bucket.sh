#!/bin/bash

set -euo pipefail

ENVIRONMENT="${1:-}"

if [[ "$ENVIRONMENT" != "dev" && "$ENVIRONMENT" != "uat" ]]; then
    echo "ERROR: Environment must be dev or uat"
    exit 1
fi

BUCKET_NAME="terraform-learning-lab-514407-lab14-${ENVIRONMENT}"

echo "Environment: $ENVIRONMENT"
echo "Bucket: $BUCKET_NAME"
echo "Retrieving bucket metadata..."

METADATA=$(gcloud storage buckets describe \
    "gs://${BUCKET_NAME}" \
    --format=json)

BUCKET_LABEL=$(echo "$METADATA" | jq -r '.labels.environment')
DEPLOYED_BY=$(echo "$METADATA" | jq -r '.labels.deployed_by')
PUBLIC_ACCESS=$(echo "$METADATA" | jq -r '.public_access_prevention')
UNIFORM_ACCESS=$(echo "$METADATA" | jq -r '.uniform_bucket_level_access')

if [[ "$BUCKET_LABEL" != "$ENVIRONMENT" ]]; then
    echo "ERROR: Environment label mismatch"
    exit 1
fi

echo "PASS: Environment label verified"

if [[ "$DEPLOYED_BY" != "github-actions" ]]; then
    echo "ERROR: Deployment tracking label mismatch"
    exit 1
fi

echo "PASS: Deployment tracking label verified"

if [[ "$PUBLIC_ACCESS" != "enforced" ]]; then
    echo "ERROR: Public access prevention is not enforced"
    exit 1
fi

echo "PASS: Public access prevention verified"

if [[ "$UNIFORM_ACCESS" != "true" ]]; then
    echo "ERROR: Uniform bucket-level access is disabled"
    exit 1
fi

echo "PASS: Uniform bucket-level access verified"

echo "SUCCESS: All infrastructure validation checks passed"