;;; gruvbox-material-medium-theme.el --- Gruvbox Material dark, medium contrast -*- lexical-binding: t -*-

;; Copyright (C) 2026 svranesevic

;; Author: svranesevic <svranesevic@users.noreply.github.com>
;; URL: https://github.com/svranesevic/gruvbox-material
;; SPDX-License-Identifier: MIT

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Gruvbox Material, dark background, medium contrast, material foreground.
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

(deftheme gruvbox-material-medium "Gruvbox Material dark, medium contrast.")

(gruvbox-material-theme-define 'gruvbox-material-medium 'medium)

(provide-theme 'gruvbox-material-medium)
(provide 'gruvbox-material-medium-theme)

;;; gruvbox-material-medium-theme.el ends here
