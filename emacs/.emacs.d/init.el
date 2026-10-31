;; Add ~/.emacs.d/lisp/ to the load-path to make my personal Lisp libraries
;; available.
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; --------------------------------
;; Font configuration for Emacs GUI
;; --------------------------------
;;
;; Emacs can run in two modes:
;;   1. GUI (emacs, emacsclient -c)
;;      - Font is set here.
;;   2. Terminal (emacs -nw, emacsclient -t)
;;      - Font comes from terminal emulator settings.
;;
;; To keep things consistent, set the same font family/size in both.

(when (display-graphic-p)
  (let ((my-font "Monospace-12"))   ;; <--- change family/size here
    ;; Apply font to the default frame (new windows)
    (add-to-list 'default-frame-alist `(font . ,my-font))
    ;; Apply font immediately to the current frame
    (set-face-attribute 'default nil :font my-font)))

;; Theme files go here:
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Set color scheme.
(load-theme 'vs-light t)

;; Disable GUI elements in terminal Emacs.
(unless (display-graphic-p)
  ;; Disable the startup screen.
  (setq inhibit-startup-screen t)

  ;; Disable the menu-bar.
  (menu-bar-mode -1)

  ;; Disable the tool-bar.
  (tool-bar-mode -1)

  ;; Disable the vertical scroll-bars.
  (scroll-bar-mode -1))

;; Highlight the active region.
(transient-mark-mode t)

;; Show column numbers.
(column-number-mode t)

;; Highlight trailing whitespace.
(setq-default show-trailing-whitespace t)

;; Highlight matching parentheses.
(show-paren-mode t)

;; Use box cursor in GUI for consistency with tty (which is always a box).
(set-default 'cursor-type 'box)

;; Disable cursor blinking when running Emacs in a terminal.
(setq visible-cursor nil)

;; In GUI frames, disable cursor blinking for consistency with tty.
(when (display-graphic-p)
  (blink-cursor-mode 0))

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
  )

;; Create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; Prefer UTF-8 to ISO-8859-1.
(prefer-coding-system 'utf-8)

;; Customize how Emacs labels the current end-of-line convention in the
;; mode line:
;;   LF    -> "LF"    (Unix / GNU/Linux)
;;   CRLF  -> "CRLF"  (Windows / DOS)
;;   CR    -> "CR"    (classic Mac)
;;
;; Without these overrides, Emacs uses the default mode-line labels:
;;   ":" for LF, "(DOS)" for CRLF, and "(Mac)" for CR.
(setq eol-mnemonic-unix "LF")
(setq eol-mnemonic-dos "CRLF")
(setq eol-mnemonic-mac "CR")
