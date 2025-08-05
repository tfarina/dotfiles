# Icons

This directory contains manually installed icon themes and cursor themes
I use on my desktop environment.

These are not managed by the system package manager and are safe to
include in version control.

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

After copying the themes, you need to manually select them in the XFCE
settings:

- **Icon theme**:
  Go to **Settings > Appearance > Icons** and choose the icon theme you want.

- **Cursor theme**:
  Go to **Settings > Mouse and Touchpad > Theme** and choose the cursor
  theme you want.

Changes should take effect immediately for most applications. In some cases,
you may need to restart your session to apply cursor changes system-wide.
