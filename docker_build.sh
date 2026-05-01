#!/bin/bash

# Build and push VSS Engine Docker image to Google Artifact Registry

set -e

# Configuration
IMAGE_NAME="vss-engine-pixelml"
TAG="2.4.0.17"
REGISTRY_PATH="us-central1-docker.pkg.dev/arboreal-inn-444216-h1/pixelml-us-central-1-registry"
FULL_IMAGE_NAME="${REGISTRY_PATH}/${IMAGE_NAME}:${TAG}"

# Build the Docker image
echo "Building Docker image: ${FULL_IMAGE_NAME}"
cd src/vss-engine && docker build -f docker/Dockerfile -t "${FULL_IMAGE_NAME}" . && cd -

# Push to Google Artifact Registry
echo "Pushing Docker image to registry..."
docker push "${FULL_IMAGE_NAME}"

echo "Successfully built and pushed: ${FULL_IMAGE_NAME}"
