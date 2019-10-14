#!/bin/bash
NAMESPACE=kubernetes-dashboard
TOKEN_ID="$(kubectl -n ${NAMESPACE} get secret | grep "admin-user-token" | awk {'print $1'})"
if [[ -n "${TOKEN_ID}" ]]; then
  echo "$(kubectl -n ${NAMESPACE} get secret ${TOKEN_ID} -o 'jsonpath={.data.token}' | base64 --decode)"
fi
