# Why this directory is named `x11`

This directory contains configuration files for the X Window System,
such as `.Xresources`, `.Xmodmap`, and related files.

The name **`x11`** was chosen intentionally.

Although this system currently uses the **X.Org Server (Xorg)**, these
configuration files belong to the **X11** ecosystem rather than to Xorg
specifically. Xorg is an implementation of the X11 protocol; these files
are not specific to Xorg and can be used by other X11 servers as well.

The name **X11** refers to **version 11 of the X Window System**, which
was introduced in **1987**. Despite its age, version 11 has remained the
standard protocol ever since, so "X11" continues to be the correct generic
name for the system. "Xorg", on the other hand, refers only to the X.Org
Server, one particular implementation of that protocol.

An alternative considered was simply **`x`**, since many X11 configuration
files begin with `.X`, such as `.Xresources` and `.Xmodmap`. While `x`
would also have been a reasonable and historically accurate name, `x11` was
chosen because it is slightly more explicit and immediately recognizable.

WARNING: If you're reading this because you're thinking about renaming
this directory to `xorg`, DON'T. The current name is intentional.
