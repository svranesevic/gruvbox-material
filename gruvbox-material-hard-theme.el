;;; gruvbox-material-hard-theme.el --- Gruvbox Material dark, hard contrast -*- lexical-binding: t -*-

;; Copyright (C) 2026 svranesevic

;; Author: svranesevic <svranesevic@users.noreply.github.com>
;; URL: https://github.com/svranesevic/gruvbox-material
;; SPDX-License-Identifier: MIT

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Gruvbox Material, dark background, hard contrast, material foreground.
;; See gruvbox-material.el for the palette, the faces and the
;; license.

;;; Code:

(eval-and-compile
  (require 'gruvbox-material
           (expand-file-name
            "gruvbox-material"
            (file-name-directory
             (or load-file-name
                 (bound-and-true-p byte-compile-current-file)
                 buffer-file-name)))))

(deftheme gruvbox-material-hard "Gruvbox Material dark, hard contrast.")

(gruvbox-material-theme-define 'gruvbox-material-hard 'hard)

(provide-theme 'gruvbox-material-hard)
(provide 'gruvbox-material-hard-theme)

;;; gruvbox-material-hard-theme.el ends here
