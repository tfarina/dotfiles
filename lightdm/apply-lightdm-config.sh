#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

sudo install -Dm644 \
     "$SCRIPT_DIR/lightdm-gtk-greeter.conf" \
     /etc/lightdm/lightdm-gtk-greeter.conf

echo "Applied lightdm-gtk-greeter.conf to the system."
