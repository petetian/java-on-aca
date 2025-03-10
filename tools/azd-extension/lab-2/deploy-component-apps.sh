#!/bin/bash

# Get the application code from public upstream repo, and then build the applications.
cd ../../../spring-petclinic-microservices
git submodule update --init
mvn clean package -DskipTests