# HACKING

This file documents personal workflows, tools, and development-related notes
about maintaining and customizing these dotfiles.

## Taking a Screenshot of the LightDM Greeter

To capture the LightDM greeter screen (e.g., to verify visual changes like
themes, fonts, or clock format), follow these steps:

### Requirements

- A script named `loginscreen` that captures the current display (`:0`) and
  saves it (e.g., using `grim`, `imagemagick`, or `xfce4-screenshooter`)

- Proper sudo permissions to run the script without being prompted for a
  password (edit `/etc/sudoers.d/` or use `visudo`)

### Steps

1. **Save all your work and log out.**

2. **Switch to a virtual terminal (TTY1):**

- Press `Ctrl + Alt + F1`

3. **Run your screenshot script with `sudo`:**

```sh
sudo loginscreen
```

This script should:

- Target the greeter's display (typically `:0`)

- Use a tool like `import -display :0 screenshot.png` (ImageMagick), or
  equivalent

- Save the image somewhere accessible (e.g., your home directory)

4. **Return to the graphical session (usually TTY7):**

- Press `Ctrl + Alt + F7`

5. **Log back in and check the saved screenshot.**
