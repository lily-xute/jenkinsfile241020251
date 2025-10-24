#!/bin/bash

set -eu pipefail

sudo apt-get update -y
sudo apt-get install -y curl gnupg lsb-release ca-certificates

sudo install -m 0755 -d /usr/share/keyrings
curl -fsSL https://aquasecurity.github.io/trivy-repo/deb/public.key \
  | sudo gpg --dearmor -o /usr/share/keyrings/trivy.gpg

echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" \
  | sudo tee /etc/apt/sources.list.d/trivy.list >/dev/null

sudo apt-get update -y
sudo apt-get install -y trivy

trivy --version
