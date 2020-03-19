#!/bin/bash -x
cd $(dirname $(dirname ${0}))
ROLE="$(echo ${1} | sed -r s'|^(roles/)?(.*)/?$|\2|g' | sed -r 's|/$||g')"
/usr/bin/ansible localhost -m include_role -a name=${ROLE} | tee logs/${ROLE}.log
