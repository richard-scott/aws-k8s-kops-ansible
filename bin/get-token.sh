#!/bin/bash
NAMESPACE=kubernetes-dashboard
TOKEN_ID="$(kubectl -n ${NAMESPACE} get secret | grep "admin-user-token" | awk {'print $1'})"
if [[ -n "${TOKEN_ID}" ]]; then
  kubectl -n ${NAMESPACE} describe secret ${TOKEN_ID} | egrep "^token:\s+" | awk '{print $2}'
fi
