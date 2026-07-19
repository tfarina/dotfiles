# How to Make Firefox the Default Browser on GNU/Linux

This guide explains how to make **Firefox** your system-wide default browser,
covering:

- Desktop environments (like XFCE)
- MIME handlers (`xdg-mime`)
- Command-line defaults (`x-www-browser`)
- Debian alternatives system (`update-alternatives`)

---

## 1. XFCE (4.12 and similar)

In XFCE, the preferred browser is set via:

### GUI Method
- Open **Settings Manager** → **Preferred Applications** → **Internet**
- Select **Firefox**

### Manual Method
Check or edit the config file:

```ini
~/.config/xfce4/helpers.rc
```

Make sure it includes:

```ini
WebBrowser=firefox
```

---

## 2. Set via `xdg-settings`

This sets the default browser for environments that support `xdg-utils`.

```bash
xdg-settings set default-web-browser firefox.desktop
```

To verify:

```bash
xdg-settings get default-web-browser
```

---

## 3. Set MIME Handlers via `xdg-mime`

Ensure Firefox is the default handler for:

- `http` and `https` links
- `.html` files

Run:

```bash
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https
xdg-mime default firefox.desktop text/html
```

Verify:

```bash
xdg-mime query default x-scheme-handler/http
xdg-mime query default x-scheme-handler/https
xdg-mime query default text/html
```

Expected output:

```
firefox.desktop
```

---

## 4. Set Command-Line Default via `update-alternatives`

Some CLI tools or legacy programs use the `x-www-browser` fallback. This
uses the Debian alternatives system.

### Check Current Setup

```bash
sudo update-alternatives --config x-www-browser
```

You’ll see output like:

```
There are 2 choices for the alternative x-www-browser (providing /usr/bin/x-www-browser).

  Selection    Path              Priority   Status
------------------------------------------------------------
* 0            /usr/bin/netsurf   100       auto mode
  1            /usr/bin/firefox   40        manual mode
```

In this example, Netsurf has higher priority (100) than Firefox (40), so
it's selected in auto mode.

---

### Raise Firefox's Priority to Take Over

To register Firefox with a higher priority (e.g. 200):

```bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/firefox 200
```

After this, the system will prefer Firefox in **auto mode**.

Check result:

```bash
sudo update-alternatives --display x-www-browser
```

Example output:

```
link best version is /usr/bin/firefox
link currently points to /usr/bin/firefox
/usr/bin/firefox - priority 200
/usr/bin/netsurf - priority 100
```

---

## Recap: Final Verification Checklist

| Command                                      | Expected Result         |
|---------------------------------------------|--------------------------|
| `xdg-settings get default-web-browser`      | `firefox.desktop`        |
| `xdg-mime query default x-scheme-handler/http` | `firefox.desktop`     |
| `xdg-mime query default text/html`          | `firefox.desktop`        |
| `update-alternatives --display x-www-browser` | Points to Firefox     |
| `~/.config/xfce4/helpers.rc` contains       | `WebBrowser=firefox`     |

---
