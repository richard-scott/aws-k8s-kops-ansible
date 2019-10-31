#!/bin/bash
APP="${1}"
for CMD in ingress services deployments pods configmaps secrets ; do
  kubectl get ${CMD} -A --no-headers=true | grep kubernetes-dashboard | awk '{print $1,$2}' | while read LINE ; do
    kubectl delete $(echo ${CMD} | sed 's/s$//') -n $(echo "${LINE}" | awk '{print $1}') $(echo "${LINE}" | awk '{print $2}')
  done
done
