#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

sudo install -Dm644 \
     /etc/lightdm/lightdm-gtk-greeter.conf \
     "$SCRIPT_DIR/lightdm-gtk-greeter.conf"

echo "Updated lightdm-gtk-greeter.conf from the system."
