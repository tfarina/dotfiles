; Show line numbers.
(global-linum-mode t)

; Disable startup message.
(setq inhibit-startup-message t)

; Hide left scrollbar.
(scroll-bar-mode -1)

; Minimal interface.
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))
(transient-mark-mode t)

(define-derived-mode gyp-mode python-mode "Gyp"
  "Major mode for editing Generate Your Project files."
    (setq indent-tabs-mode nil
          tab-width 2
          python-indent 2))

(add-to-list 'auto-mode-alist '("\\.gyp$" . gyp-mode))
(add-to-list 'auto-mode-alist '("\\.gypi$" . gyp-mode))

(require 'whitespace)
(setq whitespace-style '(face indentation trailing empty lines-tail))
(setq whitespace-line-column nil)
(set-face-attribute 'whitespace-line nil
		    :background "purple"
		    :foreground "white"
		    :weight 'bold)
(global-whitespace-mode 1)

(setq load-path (cons "~/chromium/src/tools/gyp/tools/emacs" load-path))
(require 'gyp)
