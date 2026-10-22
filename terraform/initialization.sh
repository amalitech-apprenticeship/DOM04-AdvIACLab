#!/usr/bin/env bash
set -euo pipefail

[[ -f ~/.ssh/deployer_lab4 ]] || ssh-keygen -t ed25519 -f ~/.ssh/deployer_lab4 -N ""

cd bootstrap
terraform init
terraform apply

cd ../envs/prod
terraform init
terraform apply

IP=$(terraform output -raw instance_ip)


