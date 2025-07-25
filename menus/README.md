# Menus

This directory contains custom `.desktop` entries and XDG menu overrides
I use on my desktop environment.

It includes:

- `applications/` – Custom `.desktop` launchers or edits to existing ones.
- `desktop-directories/` – Category definitions used by menu editors and
  desktop environments.

These files allow for better control over how applications appear in
application menus.

## Installation

To install them for your user:

```bash
mkdir -p ~/.local/share/applications
mkdir -p ~/.local/share/desktop-directories
cp -r applications/* ~/.local/share/applications/
cp -r desktop-directories/* ~/.local/share/desktop-directories/
```
