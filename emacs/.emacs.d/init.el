;; Elisp files go in ~/.emacs.d/lisp/
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Disable the startup screen.
(setq inhibit-startup-screen t)

;; Hide menu bar.
(menu-bar-mode -1)

;; Hide tool bar.
(tool-bar-mode -1)

;; Hide left scrollbar.
(scroll-bar-mode -1)

;; Minimal interface.
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))
(transient-mark-mode t)

;; Show column numbers.
(column-number-mode t)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; Create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; Prefer UTF-8 to ISO-8859-1.
(prefer-coding-system 'utf-8)

;; eol type
(setq eol-mnemonic-unix "LF")
(setq eol-mnemonic-dos "CRLF")
(setq eol-mnemonic-mac "CR")
