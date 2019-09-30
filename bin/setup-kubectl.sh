#!/bin/bash
cd $(dirname ${0})
cd ..
if [[ -n "$(which kubectl 2>/dev/null)" ]]; then
  if $(pwd)/bin/run-role.sh kubectl-export-config 2>/dev/null ; then
    kubectl cluster-info
  fi
fi
