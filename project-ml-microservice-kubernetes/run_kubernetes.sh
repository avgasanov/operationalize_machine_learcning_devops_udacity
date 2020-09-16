#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=avgasanov/udacity_project_predictions

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacityprojectpredictions --port=80 --image=$dockerpath


# Step 3:
# List kubernetes pods
kubectl wait --for=condition=Ready pod/udacityprojectpredictions
kubectl get pod

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/udacityprojectpredictions 8000:80

# in order to preserve pod comment line below this line
kubectl delete pod/udacityprojectpredictions

# sometimes kubectl add postfix and kubectl doesn't find pod. 
# I found solution for this (https://medium.com/faun/delete-kubernetes-pods-with-a-regex-f396291bba0e)
# in order to delete pods with regex i use this
# kubectl get pods -n default --no-headers=true | awk '/udacityprojectpredictions/{print $1}'| xargs  kubectl delete -n default pod
