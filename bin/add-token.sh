#!/bin/bash

[[ -z "${1}" ]] && exit 1

# Create the service account in the current namespace
# (we assume default)
kubectl create serviceaccount "${1}"

# Give that service account root on the cluster
kubectl create clusterrolebinding "${1}" \
  --clusterrole=cluster-admin \
  --serviceaccount=default:"${1}"

# Find the secret that was created to hold the token for the SA
kubectl get secrets

# Show the contents of the secret to extract the token
kubectl describe secret "${1}"-token-xxxxx
