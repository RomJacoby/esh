#!/bin/bash

# Colors for logging
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Log success messages
log_success() {
  echo -e "${GREEN}[SUCCESS]${NC} $1"
}

# Log error messages
log_error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

# Build the backend image
build_backend() {
  echo "Building backend Docker image..."
  if docker build -t $BACKEND_IMAGE ./backend; then
    log_success "Backend image built successfully."
  else
    log_error "Failed to build backend image."
    exit 1
  fi
}

# Build the frontend image
build_frontend() {
  echo "Building frontend Docker image..."
  if docker build -t $FRONTEND_IMAGE ./frontend; then
    log_success "Frontend image built successfully."
  else
    log_error "Failed to build frontend image."
    exit 1
  fi
}

# Start the containers using the pre-built images and .env file
start_containers() {
  echo "Starting application with Docker Compose..."
  if docker-compose up -d ; then
    log_success "Application started successfully."
  else
    log_error "Failed to start application."
    exit 1
  fi
}

# Main process
echo "Starting build process..."
source .env
build_backend
build_frontend
log_success "Build process completed successfully."
start_containers