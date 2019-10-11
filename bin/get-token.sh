#!/bin/bash
for NAMESPACE in kube-system kubernetes-dashboard ; do
  TOKEN_ID="$(kubectl -n ${NAMESPACE} get secret | grep "admin-user-token" | awk {'print $1'})"
  if [[ -n "${TOKEN_ID}" ]]; then
    kubectl -n ${NAMESPACE} describe secrets ${TOKEN_ID} #-o 'jsonpath={.data.token}'
    break
  fi
done
#kubectl get secret -n kube-system | grep k8sadmin | cut -d " " -f1 | xargs -n 1 | xargs kubectl get secret  -o 'jsonpath={.data.token}' -n kube-system | base64 --decode

