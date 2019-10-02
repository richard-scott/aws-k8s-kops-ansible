#!/bin/bash
kubectl -n kube-system describe secrets $(kubectl -n kube-system get secret | grep "root-user-token" | awk {'print $1'}) | grep "token:" | awk {'print $2'}
