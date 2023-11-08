;;; vs-light-theme.el --- Visual Studio IDE light theme

;; Copyright (C) 2019 , Jen-Chieh Shen

;; Author: Jen-Chieh Shen
;; URL: https://github.com/jcs090218/vs-light-theme
;; Version: 0.2
;; Package-Requires: ((emacs "24.1"))
;; Created with emacs-theme-generator, https://github.com/mswift42/theme-creator.

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Visual Studio IDE light theme.
;;

;;; Code:

(deftheme vs-light
  "Visual Studio IDE light theme.")

(custom-theme-set-faces
   'vs-light
   `(default ((t (:foreground "#000000" :background "#FFFFFF"))))
   `(font-lock-builtin-face ((t (:foreground "#006FE0"))))
   `(font-lock-comment-face ((t (:foreground "#008000"))))
   `(font-lock-constant-face ((t (:foreground "#2B91AF"))))
   `(font-lock-doc-face ((t (:foreground "#008000"))))
   `(font-lock-function-name-face ((t (:foreground "#000000"))))
   `(font-lock-keyword-face ((t (:foreground "#0000FF"))))
   `(font-lock-preprocessor-face ((t (:foreground "#0000FF"))))
   `(font-lock-string-face ((t (:foreground "#A31515"))))
   `(font-lock-type-face ((t (:foreground "#0000FF"))))
   `(font-lock-variable-name-face ((t (:foreground "#000000"))))
)

(provide-theme 'vs-light)

;;; vs-light-theme.el ends here
