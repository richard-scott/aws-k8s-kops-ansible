#!/bin/bash -e
for CHART in $(helm list -a | egrep "\s${1}$" | awk '{print $1}') ; do
  helm del --purge ${CHART}
done
for RESOURCES in ingress service deployment configmap ; do
  for RESOURCE in $(kubectl get ${RESOURCES} -n ${1} --no-headers | awk '{print $1}') ; do
    if ! kubectl describe service ${RESOURCE} -n ${1} | egrep -q "provider=kubernetes"; then
      kubectl delete ${RESOURCES} -n ${1} ${RESOURCE}
    fi
  done
done
kubectl delete crd prometheuses.monitoring.coreos.com
kubectl delete crd prometheusrules.monitoring.coreos.com
kubectl delete crd servicemonitors.monitoring.coreos.com
kubectl delete crd podmonitors.monitoring.coreos.com
kubectl delete crd alertmanagers.monitoring.coreos.com
