#!/bin/bash

DIST_DIR="jenkins_home/workspace/project-test"

IMAGE_NAME="projeto-web" 
IMAGE_TAG="1.0"          

cd "$DIST_DIR" || { echo "Diretório não encontrado: $DIST_DIR"; exit 1; }

# Construa a imagem Docker
docker build -t "$IMAGE_NAME:$IMAGE_TAG" .

# Exiba a lista de imagens
docker images

docker run -p 80:80 $IMAGE_NAME:$IMAGE_TAG