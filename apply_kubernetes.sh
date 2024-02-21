#!/bin/bash

pushd "$(dirname "$0")/" > /dev/null

KUBE="minikube kubectl --"

docker build -t minikube-flask-app .

echo "Creating the deployment..."
$KUBE apply -f flask_kube.yaml

echo "Waiting for the service to be ready..."
$KUBE get svc flask-service

popd > /dev/null


