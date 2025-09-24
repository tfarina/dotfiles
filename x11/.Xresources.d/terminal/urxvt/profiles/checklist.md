# urxvt Configuration Checklist

## Core
- [x] `termName`
- [x] `geometry`
- [x] `chdir`
- [x] `reverseVideo`
- [x] `loginShell`
- [x] `multiClickTime`
- [x] `jumpScroll`
- [x] `skipScroll`
- [x] `pastableTabs`

## Scrollbar
- [x] `scrollBar`
- [x] `scrollBar_right`
- [x] `scrollBar_floating`
- [x] `scrollBar_align`
- [x] `scrollstyle`
- [x] `thickness`
- [x] `scrollTtyOutput`
- [x] `scrollTtyKeypress`
- [x] `scrollWithBuffer`

## Transparency & Background
- [x] `inheritPixmap`
- [x] `transparent`
- [x] `tintColor`
- [x] `shading`
- [x] `blurRadius`
- [x] `fading`
- [x] `fadeColor`
- [x] `backgroundPixmap`
- [x] `background.border`
- [x] `background.expr`
- [x] `background.interval`

## Bell & Alerts
- [x] `urgentOnBell`
- [x] `visualBell`
- [x] `mapAlert`
- [ ] `bell-command`

## Cursor & Pointer
- [x] `cursorUnderline`
- [x] `cursorBlink`
- [x] `pointerBlank`
- [x] `pointerBlankDelay`

## Colors
- [x] `foreground`
- [x] `background`
- [x] `color0` → `color15`
- [ ] `colorBD`
- [ ] `colorIT`
- [ ] `colorUL`
- [ ] `colorRV`
- [x] `cursorColor`
- [ ] `cursorColor2`
- [ ] `pointerColor`
- [ ] `pointerColor2`
- [ ] `underlineColor`
- [x] `scrollColor`
- [x] `troughColor`
- [ ] `highlightColor`
- [ ] `highlightTextColor`
- [x] `borderColor`
- [ ] `tab-bg`
- [ ] `tab-fg`
- [ ] `tabbar-bg`
- [ ] `tabbar-fg`

## Fonts
- [x] `font`
- [x] `boldFont`
- [x] `italicFont`
- [x] `boldItalicFont`
- [ ] `imFont`
- [x] `skipBuiltinGlyphs`
- [x] `intensityStyles`
- [x] `lineSpace`
- [x] `letterSpace`

## Window & Borders
- [x] `iconFile`
- [x] `title`
- [x] `iconName`
- [x] `saveLines`
- [x] `buffered`
- [ ] `depth`
- [ ] `visual`
- [ ] `transient-for`
- [x] `override-redirect`
- [ ] `hold`
- [x] `externalBorder`
- [x] `internalBorder`
- [x] `borderLess`

## Input / Keyboard
- [x] `backspacekey`
- [x] `deletekey`
- [x] `modifier`
- [x] `cutchars`
- [x] `answerbackString`
- [x] `keysym.sym`
- [ ] `kuake.hotkey`

## Internationalization (IME)
- [x] `inputMethod`
- [x] `preeditType`
- [x] `imLocale`

## Perl Extensions
- [x] `perl-lib`
- [x] `perl-eval`
- [x] `perl-ext-common`
- [x] `perl-ext`

## ISO14755 (Unicode input)
- [x] `iso14755`
- [x] `iso14755_52`

## URL / Matcher
- [x] `matcher.button`
- [x] `matcher.launcher`
- [x] `matcher.launcher.*`
- [x] `matcher.pattern.*`
- [x] `matcher.rend.*`
- [x] `url-launcher`

## Remote Clipboard
- [x] `remote-clipboard.fetch`
- [x] `remote-clipboard.store`

## Selection & Clipboard
- [ ] `searchable-scrollback`
- [x] `selection-autotransform.*`
- [x] `selection-pastebin.cmd`
- [x] `selection-pastebin.url`
- [x] `selection.pattern-0`

## Misc
- [x] `path`
- [x] `insecure`
- [x] `utmpInhibit`
- [x] `mouseWheelScrollPage`
- [x] `tripleclickwords`
- [x] `print-pipe`
- [x] `xrm`
