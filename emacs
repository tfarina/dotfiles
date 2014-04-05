; Show line numbers.
(global-linum-mode t)

; Disable startup message.
(setq inhibit-startup-message t)

; Hide left scrollbar.
(scroll-bar-mode -1)

(define-derived-mode gyp-mode python-mode "Gyp"
  "Major mode for editing Generate Your Project files."
    (setq indent-tabs-mode nil
          tab-width 2
          python-indent 2))

(add-to-list 'auto-mode-alist '("\\.gyp$" . gyp-mode))
(add-to-list 'auto-mode-alist '("\\.gypi$" . gyp-mode))
