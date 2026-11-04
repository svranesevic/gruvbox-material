;;; gruvbox-material-light-hard-theme.el --- Gruvbox Material light, hard contrast -*- lexical-binding: t -*-

;; Copyright (C) 2026 svranesevic

;; Author: svranesevic <svranesevic@users.noreply.github.com>
;; URL: https://github.com/svranesevic/gruvbox-material
;; SPDX-License-Identifier: MIT

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Gruvbox Material, light background, hard contrast, material foreground.
;; See gruvbox-material.el for the palette, the faces and the license.

;;; Code:

(eval-and-compile
  (require 'gruvbox-material
           (expand-file-name
            "gruvbox-material"
            (file-name-directory
             (or load-file-name
                 (bound-and-true-p byte-compile-current-file)
                 buffer-file-name)))))

(deftheme gruvbox-material-light-hard "Gruvbox Material light, hard contrast.")

(gruvbox-material-theme-define 'gruvbox-material-light-hard 'light 'hard)

(provide-theme 'gruvbox-material-light-hard)
(provide 'gruvbox-material-light-hard-theme)

;;; gruvbox-material-light-hard-theme.el ends here
