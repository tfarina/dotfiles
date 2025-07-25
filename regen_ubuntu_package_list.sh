#!/bin/bash
# regen_ubuntu_package_list.sh
# Regenerates ubuntu_package_list.txt with all installed packages.

set -euo pipefail

OUTPUT_FILE="ubuntu_package_list.txt"

echo "Regenerating full package list of all installed packages..."

dpkg-query -W -f='${binary:Package}\n' > "$OUTPUT_FILE"

echo "Full package list saved to $OUTPUT_FILE"
