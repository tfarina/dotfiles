#!/bin/bash

# Installs all packages listed in packages.txt

set -euo pipefail

PACKAGE_LIST_FILE="packages.txt"

if [[ ! -f "$PACKAGE_LIST_FILE" ]]; then
    echo "Error: $PACKAGE_LIST_FILE not found."
    exit 1
fi

echo "Installing packages from $PACKAGE_LIST_FILE..."

# Extract package names, then install
xargs -a "$PACKAGE_LIST_FILE" sudo apt install -y

echo "Package installation completed."
