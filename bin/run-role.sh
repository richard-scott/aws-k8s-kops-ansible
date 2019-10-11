#!/bin/bash
cd $(dirname $(dirname ${0}))
pwd
/usr/bin/ansible localhost -m include_role -a name="$(echo ${1} | sed -r s'|^(roles/)?(.*)/|\2|g')"
