;; Elisp files go in ~/.emacs.d/lisp/
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Disable startup message.
(setq inhibit-startup-message t)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Show line numbers.
(global-linum-mode t)

;; Show column numbers.
(column-number-mode t)

;; Hide left scrollbar.
(scroll-bar-mode -1)

;; Minimal interface.
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))
(transient-mark-mode t)

;; Better than the default.
(load-theme 'tango-dark t)

(setq cc-other-file-alist
     '(("\\.cc" (".h"))
       ("\\.h"	(".cc"))))

(global-set-key "\C-o" 'ff-find-other-file)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; Prefer UTF-8 to ISO-8859-1.
(prefer-coding-system 'utf-8)
