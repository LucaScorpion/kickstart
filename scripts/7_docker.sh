#!/usr/bin/env bash
set -euo pipefail

echo 'Setting up Docker.'
systemctl is-enabled --quiet docker || sudo systemctl enable docker
systemctl is-active --quiet docker || sudo systemctl start docker
groups $USER | grep -q '\bdocker\b' || sudo usermod -aG docker $USER
