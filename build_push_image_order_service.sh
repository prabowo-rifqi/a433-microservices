#!/bin/bash

# Build Docker image dengan tag "order-service:latest"
docker build -t $GITHUB_USERNAME/order-service:latest .

# Menambahkan tag baru ke image agar sesuai dengan format GitHub Container Registry (GHCR)
docker tag $GITHUB_USERNAME/order-service:latest ghcr.io/$GITHUB_USERNAME/a433-microservices/order-service:latest

# Login ke GitHub Container Registry menggunakan Personal Access Token (PAT)
# - $CR_PAT adalah variabel yang berisi Personal Access Token (harus diekspor sebelumnya)
# - $GITHUB_USERNAME adalah username GitHub
echo $CR_PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Push image ke GitHub Container Registry (GHCR)
docker push ghcr.io/$GITHUB_USERNAME/a433-microservices/order-service:latest