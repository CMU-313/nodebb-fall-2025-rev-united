#!/usr/bin/env bash
set -euo pipefail

image="opensecurity/nodejsscan:latest"

echo "Pulling ${image}..."
docker pull "${image}"

echo "Starting NodeJsScan on http://localhost:9090 ..."
echo "Press Ctrl+C to stop the container."
docker run --rm -it -p 9090:9090 "${image}"
