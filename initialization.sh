#!/usr/bin/env bash
set -euo pipefail

[[ -f ~/.ssh/deployer_lab4 ]] || ssh-keygen -t ed25519 -f ~/.ssh/deployer_lab4 -N ""

cd terraform/bootstrap
terraform init
terraform apply

cd ../envs/prod
terraform init
terraform apply

cd ../../../ansible
ansible-playbook -i inventory/prod.ini playbooks/deploy.yml \
  -u ec2-user \
  --private-key ~/.ssh/deployer_lab4


