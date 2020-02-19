#!/bin/bash
cd $(dirname $(dirname ${0}))
$(bin/aws-export-profile brainomix)
if [[ -n "${AWS_REGION}" ]]; then
  ansible-playbook delete.yaml
fi
