#!/bin/bash
set -euo pipefail

# List of directories to check
TARGETS=(
    /usr/share/themes/Clearlooks-Phenix-Modified
    /usr/share/icons/elementary-xfce
    /usr/share/icons/Bluecurve-inverse
    /usr/share/backgrounds/leonidas-1-noon.jpg
)

FIX=false
if [[ "${1:-}" == "--fix" ]]; then
    FIX=true
fi

echo "Checking ownership and permissions..."

for path in "${TARGETS[@]}"; do
    if [[ ! -e "$path" ]]; then
	echo "Not found: $path"
	continue
    fi

    OWNER_GROUP=$(stat -c "%U:%G" "$path")
    PERMS=$(stat -c "%a" "$path")

    if [[ "$OWNER_GROUP" != "root:root" ]]; then
	echo "$path is owned by $OWNER_GROUP (should be root:root)"
	if $FIX; then
	    echo "Fixing ownership..."
	    sudo chown -R root:root "$path"
	fi
    fi

    if [[ -d "$path" && "$PERMS" != "755" ]]; then
	echo "Directory $path has permissions $PERMS (should be 755)"
	if $FIX; then
	    echo "Fixing directory permissions..."
	    sudo chmod -R a+rX "$path"
	    sudo find "$path" -type d -exec chmod 755 {} \;
	fi
    elif [[ -f "$path" && "$PERMS" != "644" ]]; then
	echo "File $path has permissions $PERMS (should be 644)"
	if $FIX; then
	    echo "Fixing file permissions..."
	    sudo chmod 644 "$path"
	fi
    else
	echo "$path looks good"
    fi
done

echo "Done."
