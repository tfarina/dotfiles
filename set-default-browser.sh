#!/bin/bash
# Set Firefox as default browser at all levels

# 1. MIME types
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https
xdg-mime default firefox.desktop text/html

# 2. Alternatives system
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/firefox 200
sudo update-alternatives --set x-www-browser /usr/bin/firefox

# 3. XFCE helpers.rc (optional manual patch)
if grep -q "WebBrowser=" ~/.config/xfce4/helpers.rc; then
    sed -i 's/^WebBrowser=.*/WebBrowser=firefox/' ~/.config/xfce4/helpers.rc
else
    echo "WebBrowser=firefox" >> ~/.config/xfce4/helpers.rc
fi

echo "Done. Firefox is now the default browser."
