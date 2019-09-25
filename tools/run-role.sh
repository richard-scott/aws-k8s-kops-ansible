#!/bin/bash
/usr/bin/ansible localhost -m include_role -a name="${@}"
