#!/bin/bash
kubectl -n kubernetes-dashboard describe secrets $(kubectl -n kubernetes-dashboard get secret | grep "admin-user-token" | awk {'print $1'}) | grep "token:" | awk {'print $2'}
