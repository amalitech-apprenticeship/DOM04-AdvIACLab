#!/usr/bin/env bash
set -euo pipefail


cd terraform/envs/prod
terraform destroy

cd ../../../ansible
rm -r inventory

rm -f ~/.ssh/deployer_lab4 ~/.ssh/deployer_lab4.pub
