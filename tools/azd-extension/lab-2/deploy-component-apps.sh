#!/bin/bash

# Get the application code from public upstream repo, and then build the applications.
cd ../../../spring-petclinic-microservices
git submodule update --init
mvn clean package -DskipTests

# Build the Docker image using the Dockerfile

DOCKERFILE="../tools/Dockerfile"
if [ ! -f $DOCKERFILE ]; then
    echo "Dockerfile not found at $DOCKERFILE"
    exit 1
fi

docker build -t petclinic-admin-server:latest -f $DOCKERFILE ./spring-petclinic-admin-server
docker build -t petclinic-api-gateway:latest -f $DOCKERFILE ./spring-petclinic-api-gateway
docker build -t petclinic-config-server:latest -f $DOCKERFILE ./spring-petclinic-config-server
docker build -t petclinic-customers-service:latest -f $DOCKERFILE ./spring-petclinic-customers-service
docker build -t petclinic-discovery-server:latest -f $DOCKERFILE ./spring-petclinic-discovery-server
docker build -t petclinic-vets-service:latest -f $DOCKERFILE ./spring-petclinic-vets-service
docker build -t petclinic-visits-service:latest -f $DOCKERFILE ./spring-petclinic-visits-service
