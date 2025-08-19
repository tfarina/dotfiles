;; Elisp files go in ~/.emacs.d/lisp/
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
  (let ((my-font "Ubuntu Mono-12"))   ;; <--- change family/size here
    ;; Apply font to the default frame (new windows)
    (add-to-list 'default-frame-alist `(font . ,my-font))
    ;; Apply font immediately to the current frame
    (set-face-attribute 'default nil :font my-font)))

;; Theme files go here:
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Set color scheme.
(load-theme 'vs-light t)

;; Disable the startup screen.
(setq inhibit-startup-screen t)

;; Hide menu bar.
(menu-bar-mode -1)

;; Hide tool bar.
(tool-bar-mode -1)

;; Hide left scrollbar.
(scroll-bar-mode -1)

;; Activates the mark and highlights the region.
(transient-mark-mode t)

;; Show column numbers.
(column-number-mode t)

;; Highlight trailing whitespace.
(setq-default show-trailing-whitespace t)

;; Highlight matching parentheses.
(show-paren-mode t)

;; Use box cursor in GUI for consistency with tty (which is always a box).
(set-default 'cursor-type 'box)

;; Do not blink the cursor.
(setq visible-cursor nil)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
  )

;; Create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; Prefer UTF-8 to ISO-8859-1.
(prefer-coding-system 'utf-8)

;; eol type
(setq eol-mnemonic-unix "LF")
(setq eol-mnemonic-dos "CRLF")
(setq eol-mnemonic-mac "CR")
