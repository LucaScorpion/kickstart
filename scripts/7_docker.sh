#!/usr/bin/env bash
set -euo pipefail

echo 'Setting up Docker.'
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
