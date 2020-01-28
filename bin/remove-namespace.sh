#!/bin/bash
for RESOURCES in ingress service deployment configmap ; do
  for RESOURCE in $(kubectl get ${RESOURCES} -n ${1} --no-headers | awk '{print $1}') ; do
    kubectl delete ${RESOURCES} -n ${1} ${RESOURCE}
    for CHART in $(helm list -a | egrep "\s${1}$" | awk '{print $1}') ; do
      helm del --purge ${CHART}
    done
  done
done
