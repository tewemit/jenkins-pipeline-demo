#!/bin/bash
if [[ $# -gt 0  &&  $1 = "-b" || $2 = "-b"  ]]
then
  mvn clean package -DskipTests
  docker build . -t cicd-demo
  # tag and push image
  docker tag cicd-demo tewemit/cicd-demo
  docker push tewemit/cicd-demo
else
    echo Skipping build
fi

# deploy to kubernetes
if [[ $# -gt 0  &&  $1 = "-d" || $2 = "-d" ]]
then
kubectl delete svc cicd-service
kubectl delete deployment cicd-service
kubectl apply -f deployment.yaml
else
  echo Skipping deployment
fi
