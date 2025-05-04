#!/bin/bash

# Build Docker image dengan tag "karsajobs:latest"
docker build -t $GITHUB_USERNAME/karsajobs-ui:latest .

# Menambahkan tag baru ke image agar sesuai dengan format GitHub Container Registry (GHCR)
docker tag $GITHUB_USERNAME/karsajobs-ui:latest ghcr.io/$GITHUB_USERNAME/a433-microservices/karsajobs-ui:latest

# Login ke GitHub Container Registry menggunakan Personal Access Token (PAT)
# - $CR_PAT adalah variabel yang berisi Personal Access Token (harus diekspor sebelumnya)
# - $GITHUB_USERNAME adalah username GitHub
echo $CR_PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Push image ke GitHub Container Registry (GHCR)
docker push ghcr.io/$GITHUB_USERNAME/a433-microservices/karsajobs-ui:latest