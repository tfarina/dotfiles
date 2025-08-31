#!/bin/bash

# Generates packages.txt with all installed packages.

set -euo pipefail

OUTPUT_FILE="packages.txt"

echo "Regenerating full package list of all installed packages..."

dpkg-query -W -f='${binary:Package}\n' > "$OUTPUT_FILE"

echo "Full package list saved to $OUTPUT_FILE"
