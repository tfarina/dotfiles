;;; init-neotree.el --- NeoTree configuration -*- lexical-binding: t; -*-

(require 'neotree)

;; Toggle NeoTree with F8.
(global-set-key [f8] 'neotree-toggle)

;; Display NeoTree on the right side of the frame.
(setq neo-window-position 'right)

(provide 'init-neotree)
;;; init-neotree.el ends here
