# Themes

This directory contains manually installed GTK or window manager themes.

These are not installed via package manager and are safe to version here.

## Installation

XFCE 4.12 doesn't always load icons, themes, or backgrounds correctly
from `~/.local/share`, so it's recommended to install them system-wide
instead.

To install for all users (requires root), use the provided `install-assets.sh`
script:

```bash
cd ~/dotfiles
./install-assets.sh
```

## Activating the themes in XFCE 4.12

After copying the themes, manually apply them in the XFCE settings:

- **GTK theme (for applications)**:
  Go to **Settings > Appearance > Style** and select the theme you want.

- **Window manager theme (for titlebars, borders)**:
  Go to **Settings > Window Manager > Style** and select the theme you want.

Changes should apply immediately after selection.
