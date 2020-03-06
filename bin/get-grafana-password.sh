#!/bin/bash
kubectl get secret \
--namespace $(kubectl get pods -A | egrep "$(helm list | grep grafana | awk '{print $1}')" | awk '{print $1}') \
$(kubectl get pods -A | egrep "$(helm list | grep grafana | awk '{print $1}')" | awk '{print $2}' | awk -F '-grafana-' '{print $1}')-grafana \
-o jsonpath="{.data.admin-password}" | base64 --decode
echo ""
