;;; gruvbox-material-soft-theme.el --- Gruvbox Material dark, soft contrast -*- lexical-binding: t -*-

;; Copyright (C) 2026 svranesevic

;; Author: svranesevic <svranesevic@users.noreply.github.com>
;; URL: https://github.com/svranesevic/gruvbox-material
;; SPDX-License-Identifier: MIT

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Gruvbox Material, dark background, soft contrast, material foreground.
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

(deftheme gruvbox-material-soft "Gruvbox Material dark, soft contrast.")

(gruvbox-material-theme-define 'gruvbox-material-soft 'soft)

(provide-theme 'gruvbox-material-soft)
(provide 'gruvbox-material-soft-theme)

;;; gruvbox-material-soft-theme.el ends here
