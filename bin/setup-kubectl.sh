#!/bin/bash
if [[ -n "$(which kubectl 2>/dev/null)" ]]; then
  if $(pwd)/run-role.sh kubectl-export-config ; then
    kubectl cluster-info
  fi
fi
