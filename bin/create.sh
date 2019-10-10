#!/bin/bash
cd $(dirname $(dirname ${0}))
ansible-playbook create.yaml
