#!/bin/bash

IMAGE_NAME="projeto-web" 
IMAGE_TAG="1.0"    

echo "buildando a imgem com o Dockerfile.prod e criando um nome para imagem:"
docker build -f Dockerfile.prod -t "$IMAGE_NAME:$IMAGE_TAG" .

echo "listando as imagem"
docker images

echo "rodando imagem"
docker run -p 80:80 $IMAGE_NAME:$IMAGE_TAG