#!/bin/bash
mkdir collections
ansible-galaxy collection install -f -r requirements.yml -p ./collections
cp -r collections/ansible_collections/parity/chain/roles .
