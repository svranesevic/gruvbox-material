;;; gruvbox-material.el --- Gruvbox Material dark themes -*- lexical-binding: t -*-

;; Copyright (C) 2026 svranesevic

;; Author: svranesevic <svranesevic@users.noreply.github.com>
;; Maintainer: svranesevic <svranesevic@users.noreply.github.com>
;; URL: https://github.com/svranesevic/gruvbox-material
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: faces, themes
;; SPDX-License-Identifier: MIT

;; This file is not part of GNU Emacs.

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;; Third-party notices:
;;
;; The color palette and the face choices come from Gruvbox Material
;; (https://github.com/sainnhe/gruvbox-material):
;;
;;   MIT License
;;
;;   Copyright (c) 2020 sainnhe
;;
;;   Permission is hereby granted, free of charge, to any person obtaining a copy
;;   of this software and associated documentation files (the "Software"), to deal
;;   in the Software without restriction, including without limitation the rights
;;   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;;   copies of the Software, and to permit persons to whom the Software is
;;   furnished to do so, subject to the following conditions:
;;
;;   The above copyright notice and this permission notice shall be included in all
;;   copies or substantial portions of the Software.
;;
;;   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;;   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;;   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;;   SOFTWARE.
;;
;; The list of faces comes from the Emacs themes of Token
;; (https://github.com/ThorstenRhau/token):
;;
;;   BSD 3-Clause License
;;
;;   Copyright (c) 2026, Thorsten Rhau
;;
;;   Redistribution and use in source and binary forms, with or without
;;   modification, are permitted provided that the following conditions are met:
;;
;;   1. Redistributions of source code must retain the above copyright notice, this
;;      list of conditions and the following disclaimer.
;;
;;   2. Redistributions in binary form must reproduce the above copyright notice,
;;      this list of conditions and the following disclaimer in the documentation
;;      and/or other materials provided with the distribution.
;;
;;   3. Neither the name of the copyright holder nor the names of its
;;      contributors may be used to endorse or promote products derived from
;;      this software without specific prior written permission.
;;
;;   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;;   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
;;   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
;;   FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;;   SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
;;   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
;;   OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;;   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

;;; Commentary:

;; Port of Gruvbox Material to Emacs.
;;
;; This package gives six themes, a dark and a light theme for each
;; background contrast:
;;
;;   - `gruvbox-material-dark-hard'    - `gruvbox-material-light-hard'
;;   - `gruvbox-material-dark-medium'  - `gruvbox-material-light-medium'
;;   - `gruvbox-material-dark-soft'    - `gruvbox-material-light-soft'
;;
;; Enable one with, for example:
;;
;;   (load-theme 'gruvbox-material-dark-medium t)
;;
;; The user option `gruvbox-material-saturation' sets the strength
;; of the accent colors.  A value of 1.0 gives the exact upstream colors.
;;
;; Credits:
;;
;; - The colors are the "material" palettes of Gruvbox Material by
;;   sainnhe (https://github.com/sainnhe/gruvbox-material), MIT license.
;;   The face choices follow colors/gruvbox-material.vim with its default
;;   options (float_style "bright", visual "grey background", menu
;;   selection "grey").
;; - The list of faces is adapted from the Emacs themes of Token by
;;   Thorsten Rhau (https://github.com/ThorstenRhau/token), BSD 3-Clause
;;   license, which come from work by srg-dev.
;;
;; The full license texts of these projects are in the header of this
;; file and in THIRD-PARTY-NOTICES.md.

;;; Code:

(require 'color)

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(defconst gruvbox-material-backgrounds
  '(
    (dark
      (hard
        (bg-dim           . "#141617")
        (bg0              . "#1d2021")
        (bg1              . "#282828")
        (bg2              . "#282828")
        (bg3              . "#3c3836")
        (bg4              . "#3c3836")
        (bg5              . "#504945")
        (bg-statusline1   . "#282828")
        (bg-statusline2   . "#32302f")
        (bg-statusline3   . "#504945")
        (bg-visual-red    . "#442e2d")
        (bg-visual-yellow . "#473c29")
        (bg-visual-green  . "#333e34")
        (bg-visual-blue   . "#2e3b3b")
        (bg-visual-purple . "#3c333b")
        (bg-diff-red      . "#3c1f1e")
        (bg-diff-green    . "#32361a")
        (bg-diff-blue     . "#0d3138")
        (bg-current-word  . "#32302f"))
      (medium
        (bg-dim           . "#1b1b1b")
        (bg0              . "#282828")
        (bg1              . "#32302f")
        (bg2              . "#32302f")
        (bg3              . "#45403d")
        (bg4              . "#45403d")
        (bg5              . "#5a524c")
        (bg-statusline1   . "#32302f")
        (bg-statusline2   . "#3a3735")
        (bg-statusline3   . "#504945")
        (bg-visual-red    . "#4c3432")
        (bg-visual-yellow . "#4f422e")
        (bg-visual-green  . "#3b4439")
        (bg-visual-blue   . "#374141")
        (bg-visual-purple . "#443840")
        (bg-diff-red      . "#402120")
        (bg-diff-green    . "#34381b")
        (bg-diff-blue     . "#0e363e")
        (bg-current-word  . "#3c3836"))
      (soft
        (bg-dim           . "#252423")
        (bg0              . "#32302f")
        (bg1              . "#3c3836")
        (bg2              . "#3c3836")
        (bg3              . "#504945")
        (bg4              . "#504945")
        (bg5              . "#665c54")
        (bg-statusline1   . "#3c3836")
        (bg-statusline2   . "#46413e")
        (bg-statusline3   . "#5b534d")
        (bg-visual-red    . "#543937")
        (bg-visual-yellow . "#574833")
        (bg-visual-green  . "#424a3e")
        (bg-visual-blue   . "#404946")
        (bg-visual-purple . "#4b3e45")
        (bg-diff-red      . "#472322")
        (bg-diff-green    . "#3d4220")
        (bg-diff-blue     . "#0f3a42")
        (bg-current-word  . "#45403d")))
    (light
      (hard
        (bg-dim           . "#f3eac7")
        (bg0              . "#f9f5d7")
        (bg1              . "#f5edca")
        (bg2              . "#f3eac7")
        (bg3              . "#f2e5bc")
        (bg4              . "#eee0b7")
        (bg5              . "#ebdbb2")
        (bg-statusline1   . "#f5edca")
        (bg-statusline2   . "#f3eac7")
        (bg-statusline3   . "#eee0b7")
        (bg-visual-red    . "#f0ddc3")
        (bg-visual-yellow . "#f9eabf")
        (bg-visual-green  . "#dde5c2")
        (bg-visual-blue   . "#d9e1cc")
        (bg-visual-purple . "#eee2d1")
        (bg-diff-red      . "#f8e4c9")
        (bg-diff-green    . "#e4edc8")
        (bg-diff-blue     . "#e0e9d3")
        (bg-current-word  . "#f3eac7"))
      (medium
        (bg-dim           . "#f2e5bc")
        (bg0              . "#fbf1c7")
        (bg1              . "#f4e8be")
        (bg2              . "#f2e5bc")
        (bg3              . "#eee0b7")
        (bg4              . "#e5d5ad")
        (bg5              . "#ddccab")
        (bg-statusline1   . "#f2e5bc")
        (bg-statusline2   . "#f2e5bc")
        (bg-statusline3   . "#e5d5ad")
        (bg-visual-red    . "#f1d9b5")
        (bg-visual-yellow . "#fae7b3")
        (bg-visual-green  . "#dee2b6")
        (bg-visual-blue   . "#dadec0")
        (bg-visual-purple . "#efdec3")
        (bg-diff-red      . "#f9e0bb")
        (bg-diff-green    . "#e6eabc")
        (bg-diff-blue     . "#e2e6c7")
        (bg-current-word  . "#f2e5bc"))
      (soft
        (bg-dim           . "#ebdbb2")
        (bg0              . "#f2e5bc")
        (bg1              . "#eddeb5")
        (bg2              . "#ebdbb2")
        (bg3              . "#e6d5ae")
        (bg4              . "#dac9a5")
        (bg5              . "#d5c4a1")
        (bg-statusline1   . "#ebdbb2")
        (bg-statusline2   . "#ebdbb2")
        (bg-statusline3   . "#dac9a5")
        (bg-visual-red    . "#efd2b3")
        (bg-visual-yellow . "#f3deaa")
        (bg-visual-green  . "#d7d9ae")
        (bg-visual-blue   . "#d3d5b8")
        (bg-visual-purple . "#e8d4ba")
        (bg-diff-red      . "#f7d9b9")
        (bg-diff-green    . "#dfe1b4")
        (bg-diff-blue     . "#dbddbf")
        (bg-current-word  . "#ebdbb2"))))
  "Background palettes, one for each background and contrast.
Each element has the form (BACKGROUND (CONTRAST . COLORS)...).")

(defconst gruvbox-material-foregrounds
  '(
    (dark
      (fg0       . "#d4be98")
      (fg1       . "#ddc7a1")
      (red       . "#ea6962")
      (orange    . "#e78a4e")
      (yellow    . "#d8a657")
      (green     . "#a9b665")
      (aqua      . "#89b482")
      (blue      . "#7daea3")
      (purple    . "#d3869b")
      (bg-red    . "#ea6962")
      (bg-green  . "#a9b665")
      (bg-yellow . "#d8a657"))
    (light
      (fg0       . "#654735")
      (fg1       . "#4f3829")
      (red       . "#c14a4a")
      (orange    . "#c35e0a")
      (yellow    . "#b47109")
      (green     . "#6c782e")
      (aqua      . "#4c7a5d")
      (blue      . "#45707a")
      (purple    . "#945e80")
      (bg-red    . "#ae5858")
      (bg-green  . "#6f8352")
      (bg-yellow . "#a96b2c")))
  "\"Material\" foreground palettes, one for each background.")

(defconst gruvbox-material-greys
  '(
    (dark
      (grey0 . "#7c6f64")
      (grey1 . "#928374")
      (grey2 . "#a89984"))
    (light
      (grey0 . "#a89984")
      (grey1 . "#928374")
      (grey2 . "#7c6f64")))
  "Grey palettes, one for each background.
In each palette, grey0 has the lowest contrast with the background.")

(defgroup gruvbox-material nil
  "Gruvbox Material themes."
  :group 'faces
  :prefix "gruvbox-material-"
  :link '(url-link "https://github.com/svranesevic/gruvbox-material"))

(defun gruvbox-material--reload-enabled-themes ()
  "Load again each enabled gruvbox-material theme.
Keep the order of precedence of the enabled themes."
  (dolist (theme (reverse custom-enabled-themes))
    (when (string-prefix-p "gruvbox-material-" (symbol-name theme))
      (load-theme theme t))))

(defvar gruvbox-material--reloading nil
  "Non-nil while `gruvbox-material--set-and-reload' loads the themes again.")

(defun gruvbox-material--set-and-reload (symbol value)
  "Set SYMBOL to VALUE, then load again the enabled gruvbox-material themes.
Do not load the themes when VALUE does not change, or when a reload
already runs.  `load-theme' enables the `user' theme, and that sets each
customized variable again through this function.
When Customize recorded a value in the `user' theme, record VALUE there
too.  Otherwise `load-theme' puts the old Customize value back, and a
value from `setopt' does not apply."
  (let ((changed (not (and (default-boundp symbol)
                           (equal value (default-toplevel-value symbol))))))
    (set-default-toplevel-value symbol value)
    (when (and changed (assq 'user (get symbol 'theme-value)))
      (custom-push-theme 'theme-value symbol 'user 'set (custom-quote value)))
    (when (and changed (not gruvbox-material--reloading))
      (let ((gruvbox-material--reloading t))
        (gruvbox-material--reload-enabled-themes)))))

(defcustom gruvbox-material-saturation 1.2
  "Factor for the HSL saturation of the accent colors.
1.0 gives the exact upstream colors.  Larger values give stronger colors.
The lightness does not change, thus the contrast stays the same.
Neutral colors (backgrounds, greys, text) do not change.
Set it with `setopt', `customize-set-variable' or Customize to apply
it to an enabled theme.
A plain `setq' applies only at the next `load-theme'."
  :type 'number
  :initialize #'custom-initialize-default
  :set #'gruvbox-material--set-and-reload
  :group 'gruvbox-material)

(defconst gruvbox-material--saturated-colors
  '(red orange yellow green aqua blue purple bg-red bg-green bg-yellow
    bg-visual-red bg-visual-yellow bg-visual-green bg-visual-blue
    bg-visual-purple bg-diff-red bg-diff-green bg-diff-blue)
  "Palette colors that `gruvbox-material-saturation' changes.")

(defun gruvbox-material--saturate (hex factor)
  "Return HEX with its HSL saturation multiplied by FACTOR."
  (pcase-let* ((`(,r ,g ,b)
                (mapcar (lambda (i) (/ (string-to-number (substring hex i (+ i 2)) 16) 255.0))
                        '(1 3 5)))
               (`(,h ,s ,l) (color-rgb-to-hsl r g b)))
    (apply #'format "#%02x%02x%02x"
           (mapcar (lambda (c) (round (* c 255)))
                   (color-hsl-to-rgb h (min 1.0 (* s factor)) l)))))

(defun gruvbox-material--palette (background contrast)
  "Return the full palette for BACKGROUND and CONTRAST.
BACKGROUND is `dark' or `light'.  CONTRAST is `hard', `medium' or
`soft'.  Apply `gruvbox-material-saturation' to the accent colors."
  (mapcar (lambda (entry)
            (if (and (memq (car entry) gruvbox-material--saturated-colors)
                     (/= gruvbox-material-saturation 1.0))
                (cons (car entry)
                      (gruvbox-material--saturate
                       (cdr entry) gruvbox-material-saturation))
              entry))
          (append (alist-get contrast
                             (alist-get background gruvbox-material-backgrounds))
                  (alist-get background gruvbox-material-foregrounds)
                  (alist-get background gruvbox-material-greys))))

(defun gruvbox-material--color (palette name)
  "Return color NAME from PALETTE.  Signal an error if it is missing."
  (or (alist-get name palette)
      (error "Gruvbox-material: no color `%s'" name)))

(defun gruvbox-material-theme-define (theme background contrast)
  "Set the faces and variables of THEME.
Use the palette for BACKGROUND (`dark' or `light') and CONTRAST
\(`hard', `medium' or `soft')."
  (unless (memq background '(dark light))
    (error "Gruvbox-material: unknown background `%s'" background))
  (let* ((palette (gruvbox-material--palette background contrast))
         (class '((class color) (min-colors 89)))
         (aqua             (gruvbox-material--color palette 'aqua))
         (bg-current-word  (gruvbox-material--color palette 'bg-current-word))
         (bg-diff-blue     (gruvbox-material--color palette 'bg-diff-blue))
         (bg-diff-green    (gruvbox-material--color palette 'bg-diff-green))
         (bg-diff-red      (gruvbox-material--color palette 'bg-diff-red))
         (bg-green         (gruvbox-material--color palette 'bg-green))
         (bg-red           (gruvbox-material--color palette 'bg-red))
         (bg-statusline1   (gruvbox-material--color palette 'bg-statusline1))
         (bg-statusline2   (gruvbox-material--color palette 'bg-statusline2))
         (bg-visual-blue   (gruvbox-material--color palette 'bg-visual-blue))
         (bg-visual-green  (gruvbox-material--color palette 'bg-visual-green))
         (bg-visual-red    (gruvbox-material--color palette 'bg-visual-red))
         (bg-visual-yellow (gruvbox-material--color palette 'bg-visual-yellow))
         (bg0              (gruvbox-material--color palette 'bg0))
         (bg1              (gruvbox-material--color palette 'bg1))
         (bg3              (gruvbox-material--color palette 'bg3))
         (bg5              (gruvbox-material--color palette 'bg5))
         (blue             (gruvbox-material--color palette 'blue))
         (fg0              (gruvbox-material--color palette 'fg0))
         (fg1              (gruvbox-material--color palette 'fg1))
         (green            (gruvbox-material--color palette 'green))
         (grey0            (gruvbox-material--color palette 'grey0))
         (grey1            (gruvbox-material--color palette 'grey1))
         (grey2            (gruvbox-material--color palette 'grey2))
         (orange           (gruvbox-material--color palette 'orange))
         (purple           (gruvbox-material--color palette 'purple))
         (red              (gruvbox-material--color palette 'red))
         (yellow           (gruvbox-material--color palette 'yellow))
         (dark             (eq background 'dark))
         ;; Upstream uses grey1 for inlay hints on a light background.
         (inlay-hint       (if dark grey0 grey1))
         ;; ANSI black and white change places on a light background.
         (term-black        (if dark bg-statusline1 fg0))
         (term-white        (if dark fg1 bg5))
         (term-bright-black (if dark grey0 grey2))
         (term-bright-white (if dark fg0 bg5)))
    (custom-theme-set-variables
     theme
     `(lsp-ui-doc-border ,grey1))

    (custom-theme-set-faces
     theme

     ;; ── Core ─────────────────────────────────────────────────────────────────
     `(default                           ((,class (:foreground ,fg0 :background ,bg0))))
     `(cursor                            ((,class (:background ,fg0))))
     `(fringe                            ((,class (:foreground ,grey0 :background ,bg0))))
     `(region                            ((,class (:background ,bg3 :extend t))))
     `(secondary-selection               ((,class (:background ,bg-current-word :extend t))))
     `(highlight                         ((,class (:background ,bg-current-word))))
     `(hl-line                           ((,class (:background ,bg1 :extend t))))
     `(shadow                            ((,class (:foreground ,grey1))))
     `(vertical-border                   ((,class (:foreground ,bg5))))
     `(window-divider                    ((,class (:foreground ,bg5))))
     `(window-divider-first-pixel        ((,class (:foreground ,bg5))))
     `(window-divider-last-pixel         ((,class (:foreground ,bg5))))
     `(internal-border                   ((,class (:background ,bg0))))
     `(child-frame-border                ((,class (:background ,grey1))))
     `(fill-column-indicator             ((,class (:foreground ,bg5))))
     `(separator-line                    ((,class (:foreground ,bg3))))
     `(nobreak-space                     ((,class (:foreground ,grey0 :underline t))))
     `(nobreak-hyphen                    ((,class (:foreground ,grey0))))
     `(homoglyph                         ((,class (:foreground ,yellow))))
     `(escape-glyph                      ((,class (:foreground ,aqua))))
     `(glyphless-char                    ((,class (:foreground ,grey0))))
     `(trailing-whitespace               ((,class (:background ,red))))
     `(tooltip                           ((,class (:foreground ,fg1 :background ,bg3))))
     `(menu                              ((,class (:foreground ,fg1 :background ,bg3))))
     `(minibuffer-prompt                 ((,class (:foreground ,orange :weight bold))))
     `(link                              ((,class (:foreground ,blue :underline t))))
     `(link-visited                      ((,class (:foreground ,purple :underline t))))
     `(button                            ((,class (:foreground ,blue :underline t))))
     `(bookmark-face                     ((,class (:foreground ,orange :background ,bg3))))
     `(bookmark-menu-bookmark            ((,class (:foreground ,orange :weight bold))))

     ;; ── Text / Formatting ────────────────────────────────────────────────────
     `(bold                              ((,class (:weight bold))))
     `(italic                            ((,class (:slant italic))))
     `(bold-italic                       ((,class (:weight bold :slant italic))))
     `(underline                         ((,class (:underline t))))

     ;; ── Line numbers ─────────────────────────────────────────────────────────
     `(line-number                       ((,class (:foreground ,grey0 :background ,bg0))))
     `(line-number-current-line          ((,class (:foreground ,grey2 :background ,bg1 :weight bold))))
     `(line-number-major-tick            ((,class (:foreground ,grey1 :background ,bg0 :weight bold))))
     `(line-number-minor-tick            ((,class (:foreground ,grey0 :background ,bg0))))

     ;; ── Mode line ────────────────────────────────────────────────────────────
     `(mode-line                         ((,class (:foreground ,fg1 :background ,bg-statusline2))))
     `(mode-line-inactive                ((,class (:foreground ,grey1 :background ,bg-statusline1))))
     `(mode-line-buffer-id               ((,class (:foreground ,orange :weight bold))))
     `(mode-line-highlight               ((,class (:foreground ,orange))))
     `(mode-line-emphasis                ((,class (:weight bold))))
     `(header-line                       ((,class (:foreground ,fg1 :background ,bg-statusline2))))
     `(header-line-highlight             ((,class (:foreground ,orange :weight bold))))
     `(doom-modeline-buffer-path         ((,class (:foreground ,grey1))))
     `(doom-modeline-buffer-file         ((,class (:foreground ,fg0 :weight bold))))
     `(doom-modeline-buffer-modified     ((,class (:foreground ,orange))))
     `(doom-modeline-project-dir         ((,class (:foreground ,blue))))
     `(doom-modeline-error               ((,class (:foreground ,red :weight bold))))
     `(doom-modeline-warning             ((,class (:foreground ,yellow :weight bold))))
     `(doom-modeline-info                ((,class (:foreground ,green :weight bold))))

     ;; ── Tab bar / Tab line ───────────────────────────────────────────────────
     `(tab-bar                           ((,class (:foreground ,grey1 :background ,bg-statusline1))))
     `(tab-bar-tab                       ((,class (:foreground ,fg0 :background ,bg0 :weight bold))))
     `(tab-bar-tab-inactive              ((,class (:foreground ,grey1 :background ,bg-statusline1))))
     `(tab-bar-tab-group-current         ((,class (:foreground ,orange :background ,bg0 :weight bold))))
     `(tab-bar-tab-group-inactive        ((,class (:foreground ,grey1 :background ,bg-statusline1))))
     `(tab-bar-tab-ungrouped             ((,class (:foreground ,grey0 :background ,bg-statusline1))))
     `(tab-line                          ((,class (:foreground ,grey1 :background ,bg-statusline1))))
     `(tab-line-tab                      ((,class (:foreground ,fg1 :background ,bg0))))
     `(tab-line-tab-current              ((,class (:foreground ,fg0 :background ,bg0 :weight bold))))
     `(tab-line-tab-inactive             ((,class (:foreground ,grey1 :background ,bg-statusline1))))
     `(tab-line-tab-modified             ((,class (:foreground ,orange))))
     `(tab-line-highlight                ((,class (:foreground ,fg0 :background ,bg-current-word))))
     `(tab-line-close-highlight          ((,class (:foreground ,red))))
     `(tab-line-new-tab                  ((,class (:foreground ,green))))

     ;; ── Whitespace ───────────────────────────────────────────────────────────
     `(whitespace-space                  ((,class (:foreground ,bg5))))
     `(whitespace-hspace                 ((,class (:foreground ,bg5))))
     `(whitespace-tab                    ((,class (:foreground ,bg5))))
     `(whitespace-newline                ((,class (:foreground ,bg5))))
     `(whitespace-missing-newline-at-eof ((,class (:foreground ,red))))
     `(whitespace-trailing               ((,class (:foreground ,red :background ,bg-diff-red))))
     `(whitespace-line                   ((,class (:background ,bg-diff-red))))
     `(whitespace-space-before-tab       ((,class (:background ,bg-diff-red))))
     `(whitespace-indentation            ((,class (:foreground ,grey0))))
     `(whitespace-big-indent             ((,class (:background ,bg-diff-red))))
     `(whitespace-empty                  ((,class (:background ,bg-diff-blue))))
     `(whitespace-space-after-tab        ((,class (:background ,bg-diff-red))))

     ;; ── Font lock ────────────────────────────────────────────────────────────
     `(font-lock-comment-face            ((,class (:foreground ,grey1 :slant italic))))
     `(font-lock-comment-delimiter-face  ((,class (:foreground ,grey1 :slant italic))))
     `(font-lock-doc-face                ((,class (:foreground ,grey1 :slant italic))))
     `(font-lock-doc-markup-face         ((,class (:foreground ,aqua :slant italic))))
     `(font-lock-string-face             ((,class (:foreground ,aqua))))
     `(font-lock-keyword-face            ((,class (:foreground ,red))))
     `(font-lock-builtin-face            ((,class (:foreground ,orange))))
     `(font-lock-function-name-face      ((,class (:foreground ,green))))
     `(font-lock-function-call-face      ((,class (:foreground ,green))))
     `(font-lock-variable-name-face      ((,class (:foreground ,fg0))))
     `(font-lock-variable-use-face       ((,class (:foreground ,fg0))))
     `(font-lock-type-face               ((,class (:foreground ,yellow))))
     `(font-lock-constant-face           ((,class (:foreground ,purple))))
     `(font-lock-preprocessor-face       ((,class (:foreground ,purple))))
     `(font-lock-negation-char-face      ((,class (:foreground ,red))))
     `(font-lock-warning-face            ((,class (:foreground ,yellow :weight bold))))
     `(font-lock-regexp-grouping-backslash ((,class (:foreground ,green))))
     `(font-lock-regexp-grouping-construct ((,class (:foreground ,green))))
     `(font-lock-escape-face             ((,class (:foreground ,green))))
     `(font-lock-number-face             ((,class (:foreground ,purple))))
     `(font-lock-operator-face           ((,class (:foreground ,orange))))
     `(font-lock-delimiter-face          ((,class (:foreground ,fg0))))
     `(font-lock-bracket-face            ((,class (:foreground ,fg0))))
     `(font-lock-punctuation-face        ((,class (:foreground ,fg0))))
     `(font-lock-misc-punctuation-face   ((,class (:foreground ,fg0))))
     `(font-lock-property-name-face      ((,class (:foreground ,blue))))
     `(font-lock-property-use-face       ((,class (:foreground ,blue))))
     `(font-lock-reference-face          ((,class (:foreground ,aqua))))

     ;; ── treesit-fold ─────────────────────────────────────────────────────────
     `(treesit-fold-replacement-face     ((,class (:foreground ,grey1 :background ,bg3))))

     ;; ── Search ───────────────────────────────────────────────────────────────
     `(isearch                           ((,class (:foreground ,bg0 :background ,bg-red))))
     `(isearch-fail                      ((,class (:foreground ,red :background ,bg-visual-red))))
     `(isearch-group-1                   ((,class (:foreground ,bg0 :background ,orange))))
     `(isearch-group-2                   ((,class (:foreground ,bg0 :background ,yellow))))
     `(lazy-highlight                    ((,class (:foreground ,bg0 :background ,bg-green))))
     `(match                             ((,class (:foreground ,bg0 :background ,bg-green))))
     `(query-replace                     ((,class (:foreground ,bg0 :background ,bg-red))))

     ;; ── Occur / grep / compilation ───────────────────────────────────────────
     `(occur-match                       ((,class (:foreground ,bg0 :background ,bg-green))))
     `(occur-prefix                      ((,class (:foreground ,grey1))))
     `(occur-suffix                      ((,class (:foreground ,grey1))))
     `(grep-match-face                   ((,class (:foreground ,bg0 :background ,bg-green))))
     `(grep-hit-face                     ((,class (:foreground ,orange :weight bold))))
     `(grep-context-face                 ((,class (:foreground ,grey1))))
     `(compilation-error                 ((,class (:foreground ,red :weight bold))))
     `(compilation-warning               ((,class (:foreground ,yellow))))
     `(compilation-info                  ((,class (:foreground ,blue))))
     `(compilation-mode-line-exit        ((,class (:foreground ,green :weight bold))))
     `(compilation-mode-line-fail        ((,class (:foreground ,red :weight bold))))
     `(compilation-mode-line-run         ((,class (:foreground ,yellow :weight bold))))
     `(compilation-line-number           ((,class (:foreground ,orange))))
     `(compilation-column-number         ((,class (:foreground ,grey1))))
     `(compilation-face                  ((,class (:foreground ,fg0))))
     `(next-error                        ((,class (:background ,bg-diff-blue :extend t))))

     ;; ── Parentheses / Delimiters ─────────────────────────────────────────────
     `(show-paren-match                  ((,class (:background ,bg3 :weight bold))))
     `(show-paren-mismatch               ((,class (:foreground ,bg0 :background ,red))))
     `(show-paren-match-expression       ((,class (:background ,bg1))))
     `(rainbow-delimiters-depth-1-face   ((,class (:foreground ,orange))))
     `(rainbow-delimiters-depth-2-face   ((,class (:foreground ,yellow))))
     `(rainbow-delimiters-depth-3-face   ((,class (:foreground ,green))))
     `(rainbow-delimiters-depth-4-face   ((,class (:foreground ,aqua))))
     `(rainbow-delimiters-depth-5-face   ((,class (:foreground ,blue))))
     `(rainbow-delimiters-depth-6-face   ((,class (:foreground ,purple))))
     `(rainbow-delimiters-depth-7-face   ((,class (:foreground ,red))))
     `(rainbow-delimiters-depth-8-face   ((,class (:foreground ,grey2))))
     `(rainbow-delimiters-depth-9-face   ((,class (:foreground ,fg1))))
     `(rainbow-delimiters-base-error-face ((,class (:foreground ,red))))
     `(rainbow-delimiters-mismatched-face ((,class (:foreground ,bg0 :background ,red))))
     `(rainbow-delimiters-unmatched-face ((,class (:foreground ,bg0 :background ,red))))
     `(paren-face                        ((,class (:foreground ,grey0))))

     ;; ── Outline ──────────────────────────────────────────────────────────────
     `(outline-1                         ((,class (:foreground ,red :weight bold))))
     `(outline-2                         ((,class (:foreground ,orange :weight bold))))
     `(outline-3                         ((,class (:foreground ,yellow :weight bold))))
     `(outline-4                         ((,class (:foreground ,green :weight bold))))
     `(outline-5                         ((,class (:foreground ,blue :weight bold))))
     `(outline-6                         ((,class (:foreground ,purple :weight bold))))
     `(outline-7                         ((,class (:foreground ,aqua :weight bold))))
     `(outline-8                         ((,class (:foreground ,grey2 :weight bold))))
     `(outline-minor-0                   ((,class (:background ,bg3))))
     `(outline-minor-1                   ((,class (:foreground ,orange :weight bold))))

     ;; ── Diffs ────────────────────────────────────────────────────────────────
     `(diff-header                       ((,class (:foreground ,fg0 :background ,bg1 :weight bold :extend t))))
     `(diff-file-header                  ((,class (:foreground ,orange :background ,bg1 :weight bold :extend t))))
     `(diff-index                        ((,class (:foreground ,grey1 :background ,bg1 :extend t))))
     `(diff-function                     ((,class (:foreground ,aqua :background ,bg-diff-blue :extend t))))
     `(diff-hunk-header                  ((,class (:foreground ,aqua :background ,bg-diff-blue :extend t))))
     `(diff-added                        ((,class (:foreground ,green :background ,bg-diff-green :extend t))))
     `(diff-removed                      ((,class (:foreground ,red :background ,bg-diff-red :extend t))))
     `(diff-changed                      ((,class (:foreground ,yellow :background ,bg-diff-blue :extend t))))
     `(diff-unchanged                    ((,class (:foreground ,grey1 :extend t))))
     `(diff-context                      ((,class (:foreground ,grey1 :extend t))))
     `(diff-indicator-added              ((,class (:foreground ,green :background ,bg-diff-green))))
     `(diff-indicator-removed            ((,class (:foreground ,red :background ,bg-diff-red))))
     `(diff-indicator-changed            ((,class (:foreground ,yellow :background ,bg-diff-blue))))
     `(diff-refine-added                 ((,class (:background ,bg-visual-green :extend t))))
     `(diff-refine-removed               ((,class (:background ,bg-visual-red :extend t))))
     `(diff-refine-changed               ((,class (:background ,bg-visual-blue :extend t))))
     `(diff-nonexistent                  ((,class (:foreground ,grey0))))
     `(diff-error                        ((,class (:foreground ,red :weight bold))))

     ;; ── Version control ──────────────────────────────────────────────────────
     `(vc-state-base                     ((,class (:foreground ,grey1))))
     `(vc-up-to-date-state               ((,class (:foreground ,grey1))))
     `(vc-edited-state                   ((,class (:foreground ,yellow))))
     `(vc-conflict-state                 ((,class (:foreground ,red :weight bold))))
     `(vc-locally-added-state            ((,class (:foreground ,green))))
     `(vc-missing-state                  ((,class (:foreground ,red))))
     `(vc-removed-state                  ((,class (:foreground ,red))))
     `(vc-needs-update-state             ((,class (:foreground ,blue))))
     `(vc-dir-status-warning             ((,class (:foreground ,yellow))))
     `(vc-dir-status-ignored             ((,class (:foreground ,grey0))))
     `(vc-dir-directory                  ((,class (:foreground ,blue :weight bold))))
     `(vc-dir-file                       ((,class (:foreground ,fg0))))
     `(vc-dir-mark-indicator             ((,class (:foreground ,orange))))
     `(diff-hl-insert                    ((,class (:foreground ,green :background ,bg-diff-green))))
     `(diff-hl-delete                    ((,class (:foreground ,red :background ,bg-diff-red))))
     `(diff-hl-change                    ((,class (:foreground ,yellow :background ,bg-diff-blue))))
     `(diff-hl-margin-insert             ((,class (:foreground ,green))))
     `(diff-hl-margin-delete             ((,class (:foreground ,red))))
     `(diff-hl-margin-change             ((,class (:foreground ,yellow))))
     `(diff-hl-reverted-hunk-highlight   ((,class (:foreground ,fg0 :background ,bg-current-word))))
     `(git-gutter:added                  ((,class (:foreground ,green))))
     `(git-gutter:deleted                ((,class (:foreground ,red))))
     `(git-gutter:modified               ((,class (:foreground ,yellow))))
     `(git-gutter:unchanged              ((,class (:foreground ,grey0))))
     `(git-gutter-fr:added               ((,class (:foreground ,green :background ,bg0))))
     `(git-gutter-fr:deleted             ((,class (:foreground ,red :background ,bg0))))
     `(git-gutter-fr:modified            ((,class (:foreground ,yellow :background ,bg0))))
     `(git-timemachine-minibuffer-author-face ((,class (:foreground ,orange))))
     `(git-timemachine-minibuffer-detail-face ((,class (:foreground ,grey1))))
     `(git-timemachine-commit            ((,class (:foreground ,purple))))

     ;; ── Ediff ────────────────────────────────────────────────────────────────
     `(ediff-current-diff-A              ((,class (:background ,bg-diff-red :extend t))))
     `(ediff-current-diff-B              ((,class (:background ,bg-diff-green :extend t))))
     `(ediff-current-diff-C              ((,class (:background ,bg-diff-blue :extend t))))
     `(ediff-current-diff-Ancestor       ((,class (:background ,bg-current-word :extend t))))
     `(ediff-even-diff-A                 ((,class (:background ,bg3 :extend t))))
     `(ediff-even-diff-B                 ((,class (:background ,bg3 :extend t))))
     `(ediff-even-diff-C                 ((,class (:background ,bg3 :extend t))))
     `(ediff-even-diff-Ancestor          ((,class (:background ,bg3 :extend t))))
     `(ediff-odd-diff-A                  ((,class (:background ,bg-current-word :extend t))))
     `(ediff-odd-diff-B                  ((,class (:background ,bg-current-word :extend t))))
     `(ediff-odd-diff-C                  ((,class (:background ,bg-current-word :extend t))))
     `(ediff-odd-diff-Ancestor           ((,class (:background ,bg-current-word :extend t))))
     `(ediff-fine-diff-A                 ((,class (:background ,bg-visual-red :extend t))))
     `(ediff-fine-diff-B                 ((,class (:background ,bg-visual-green :extend t))))
     `(ediff-fine-diff-C                 ((,class (:background ,bg-visual-blue :extend t))))
     `(ediff-fine-diff-Ancestor          ((,class (:background ,bg-current-word :extend t))))

     ;; ── Smerge ───────────────────────────────────────────────────────────────
     `(smerge-base                       ((,class (:background ,bg-diff-blue :extend t))))
     `(smerge-lower                      ((,class (:background ,bg-diff-green :extend t))))
     `(smerge-upper                      ((,class (:background ,bg-diff-red :extend t))))
     `(smerge-markers                    ((,class (:foreground ,grey1 :background ,bg3 :weight bold :extend t))))
     `(smerge-refined-added              ((,class (:background ,bg-visual-green))))
     `(smerge-refined-removed            ((,class (:background ,bg-visual-red))))
     `(smerge-refined-changed            ((,class (:background ,bg-visual-blue))))

     ;; ── Diagnostics ──────────────────────────────────────────────────────────
     `(error                             ((,class (:foreground ,red :weight bold))))
     `(warning                           ((,class (:foreground ,yellow))))
     `(success                           ((,class (:foreground ,green))))
     `(flymake-error                     ((,class (:underline (:style wave :color ,red)))))
     `(flymake-warning                   ((,class (:underline (:style wave :color ,yellow)))))
     `(flymake-note                      ((,class (:underline (:style wave :color ,green)))))
     `(flymake-error-echo                ((,class (:foreground ,red))))
     `(flymake-warning-echo              ((,class (:foreground ,yellow))))
     `(flymake-note-echo                 ((,class (:foreground ,green))))
     `(flymake-error-echo-at-eol         ((,class (:foreground ,red :slant italic))))
     `(flymake-warning-echo-at-eol       ((,class (:foreground ,yellow :slant italic))))
     `(flymake-note-echo-at-eol          ((,class (:foreground ,green :slant italic))))
     `(flycheck-error                    ((,class (:underline (:style wave :color ,red)))))
     `(flycheck-warning                  ((,class (:underline (:style wave :color ,yellow)))))
     `(flycheck-info                     ((,class (:underline (:style wave :color ,blue)))))
     `(flycheck-fringe-error             ((,class (:foreground ,red :weight bold))))
     `(flycheck-fringe-warning           ((,class (:foreground ,yellow :weight bold))))
     `(flycheck-fringe-info              ((,class (:foreground ,blue :weight bold))))
     `(flycheck-error-list-error         ((,class (:foreground ,red :weight bold))))
     `(flycheck-error-list-warning       ((,class (:foreground ,yellow))))
     `(flycheck-error-list-info          ((,class (:foreground ,blue))))
     `(flycheck-error-list-id            ((,class (:foreground ,purple))))
     `(flycheck-error-list-filename      ((,class (:foreground ,orange))))
     `(flycheck-error-list-line-column   ((,class (:foreground ,grey1))))

     ;; ── LSP ──────────────────────────────────────────────────────────────────
     `(eglot-highlight-symbol-face       ((,class (:background ,bg-current-word))))
     `(eglot-inlay-hint-face             ((,class (:foreground ,inlay-hint))))
     `(eglot-parameter-hint-face         ((,class (:foreground ,inlay-hint))))
     `(eglot-type-hint-face              ((,class (:foreground ,inlay-hint))))
     `(eglot-diagnostic-tag-unnecessary-face ((,class (:foreground ,grey0))))
     `(eglot-diagnostic-tag-deprecated-face ((,class (:foreground ,grey1 :strike-through t))))
     `(lsp-face-highlight-textual        ((,class (:background ,bg-current-word))))
     `(lsp-face-highlight-read           ((,class (:background ,bg-current-word))))
     `(lsp-face-highlight-write          ((,class (:background ,bg-current-word :weight bold))))
     `(lsp-ui-sideline-code-action       ((,class (:foreground ,yellow))))
     `(lsp-ui-sideline-current-symbol    ((,class (:foreground ,fg0 :background ,bg-current-word))))
     `(lsp-ui-sideline-symbol-info       ((,class (:foreground ,grey1 :slant italic))))
     `(lsp-inlay-hint-face               ((,class (:foreground ,inlay-hint))))
     ;; Semantic token types, with the colors of the upstream `@lsp.type.*' links.
     `(lsp-face-semhl-comment            ((,class (:foreground ,grey1 :slant italic))))
     `(lsp-face-semhl-keyword            ((,class (:foreground ,red))))
     `(lsp-face-semhl-string             ((,class (:foreground ,aqua))))
     `(lsp-face-semhl-number             ((,class (:foreground ,purple))))
     `(lsp-face-semhl-regexp             ((,class (:foreground ,green))))
     `(lsp-face-semhl-operator           ((,class (:foreground ,orange))))
     `(lsp-face-semhl-namespace          ((,class (:foreground ,yellow))))
     `(lsp-face-semhl-type               ((,class (:foreground ,yellow))))
     `(lsp-face-semhl-struct             ((,class (:foreground ,yellow))))
     `(lsp-face-semhl-class              ((,class (:foreground ,yellow))))
     `(lsp-face-semhl-interface          ((,class (:foreground ,yellow))))
     `(lsp-face-semhl-enum               ((,class (:foreground ,yellow))))
     `(lsp-face-semhl-type-parameter     ((,class (:foreground ,yellow))))
     `(lsp-face-semhl-function           ((,class (:foreground ,green))))
     `(lsp-face-semhl-method             ((,class (:foreground ,green))))
     `(lsp-face-semhl-property           ((,class (:foreground ,blue))))
     `(lsp-face-semhl-event              ((,class (:foreground ,orange))))
     `(lsp-face-semhl-macro              ((,class (:foreground ,purple))))
     `(lsp-face-semhl-variable           ((,class (:foreground ,fg0))))
     `(lsp-face-semhl-parameter          ((,class (:foreground ,fg0))))
     `(lsp-face-semhl-enum-member        ((,class (:foreground ,blue))))
     `(lsp-face-semhl-modifier           ((,class (:foreground ,orange))))
     `(lsp-face-semhl-decorator          ((,class (:foreground ,green))))

     ;; ── Floating windows (float_style "bright") ──────────────────────────────
     ;; NormalFloat = fg1 on bg3, FloatBorder = grey1, FloatTitle = orange on bg5.
     `(lsp-ui-doc-background             ((,class (:background ,bg3))))
     `(lsp-ui-doc-header                 ((,class (:foreground ,orange :background ,bg5 :weight bold))))
     `(lsp-ui-doc-highlight-hover        ((,class (:background ,bg-current-word))))
     `(lsp-ui-doc-url                    ((,class (:foreground ,blue :underline t))))
     `(lsp-ui-peek-peek                  ((,class (:background ,bg3))))
     `(lsp-ui-peek-list                  ((,class (:background ,bg3))))
     `(lsp-ui-peek-filename              ((,class (:foreground ,orange :weight bold))))
     `(lsp-ui-peek-line-number           ((,class (:foreground ,grey1))))
     `(lsp-ui-peek-highlight             ((,class (:foreground ,bg0 :background ,bg-green))))
     `(lsp-ui-peek-header                ((,class (:foreground ,orange :background ,bg5 :weight bold))))
     `(lsp-ui-peek-footer                ((,class (:background ,bg5))))
     `(lsp-ui-peek-selection             ((,class (:foreground ,bg3 :background ,grey2))))
     `(lsp-signature-posframe            ((,class (:foreground ,fg1 :background ,bg3))))
     `(lsp-signature-highlight-function-argument ((,class (:foreground ,bg0 :background ,bg-green))))
     `(posframe-border                   ((,class (:background ,grey1))))
     `(eldoc-box-body                    ((,class (:foreground ,fg1 :background ,bg3))))
     `(eldoc-box-border                  ((,class (:background ,grey1))))
     `(flycheck-posframe-face            ((,class (:foreground ,fg1))))
     `(flycheck-posframe-background-face ((,class (:background ,bg3))))
     `(flycheck-posframe-border-face     ((,class (:foreground ,grey1))))
     `(flycheck-inline-error             ((,class (:foreground ,red :background ,bg3))))
     `(flycheck-inline-warning           ((,class (:foreground ,yellow :background ,bg3))))
     `(flycheck-inline-info              ((,class (:foreground ,blue :background ,bg3))))
     `(which-key-posframe                ((,class (:foreground ,fg1 :background ,bg3))))
     `(which-key-posframe-border         ((,class (:background ,grey1))))
     `(vertico-posframe                  ((,class (:foreground ,fg1 :background ,bg3))))
     `(vertico-posframe-border           ((,class (:background ,grey1))))

     ;; ── Completions ──────────────────────────────────────────────────────────
     `(completions-common-part           ((,class (:foreground ,green :weight bold))))
     `(completions-first-difference      ((,class (:foreground ,fg0))))
     `(completions-annotations           ((,class (:foreground ,grey1 :slant italic))))
     `(completions-group-title           ((,class (:foreground ,blue :weight bold))))
     `(completions-group-separator       ((,class (:foreground ,grey0 :strike-through t))))
     `(completion-preview                ((,class (:foreground ,grey0))))
     `(completion-preview-exact          ((,class (:foreground ,grey1 :underline t))))

     ;; ── Corfu ────────────────────────────────────────────────────────────────
     `(corfu-default                     ((,class (:foreground ,fg1 :background ,bg3))))
     `(corfu-current                     ((,class (:foreground ,fg1 :background ,bg5))))
     `(corfu-bar                         ((,class (:background ,grey0))))
     `(corfu-border                      ((,class (:background ,grey1))))
     `(corfu-annotations                 ((,class (:foreground ,grey2))))
     `(corfu-deprecated                  ((,class (:foreground ,grey1 :strike-through t))))
     `(corfu-quick1                      ((,class (:foreground ,fg0 :background ,bg3 :weight bold))))
     `(corfu-quick2                      ((,class (:foreground ,fg0 :background ,bg-current-word :weight bold))))
     `(corfu-popupinfo                   ((,class (:foreground ,fg1 :background ,bg3))))

     ;; ── Company ──────────────────────────────────────────────────────────────
     `(company-tooltip                   ((,class (:foreground ,fg1 :background ,bg3))))
     `(company-tooltip-selection         ((,class (:foreground ,fg1 :background ,bg5))))
     `(company-tooltip-common            ((,class (:foreground ,green :weight bold))))
     `(company-tooltip-common-selection  ((,class (:foreground ,green :background ,bg5 :weight bold))))
     `(company-tooltip-annotation        ((,class (:foreground ,grey2))))
     `(company-tooltip-annotation-selection ((,class (:foreground ,grey2 :background ,bg5))))
     `(company-tooltip-search            ((,class (:foreground ,bg0 :background ,bg-green))))
     `(company-tooltip-search-selection  ((,class (:foreground ,bg0 :background ,bg-green))))
     `(company-tooltip-scrollbar-thumb   ((,class (:background ,grey0))))
     `(company-tooltip-scrollbar-track   ((,class (:background ,bg3))))
     `(company-preview                   ((,class (:foreground ,grey1))))
     `(company-preview-common            ((,class (:foreground ,grey0))))
     `(company-echo-common               ((,class (:foreground ,orange))))

     ;; ── Vertico ──────────────────────────────────────────────────────────────
     `(vertico-current                   ((,class (:background ,bg3 :extend t))))
     `(vertico-group-title               ((,class (:foreground ,blue :weight bold :slant italic))))
     `(vertico-group-separator           ((,class (:foreground ,grey0 :strike-through t))))
     `(vertico-multiline                 ((,class (:foreground ,grey1))))

     ;; ── Orderless ────────────────────────────────────────────────────────────
     `(orderless-match-face-0            ((,class (:foreground ,green :weight bold))))
     `(orderless-match-face-1            ((,class (:foreground ,blue :weight bold))))
     `(orderless-match-face-2            ((,class (:foreground ,orange :weight bold))))
     `(orderless-match-face-3            ((,class (:foreground ,purple :weight bold))))

     ;; ── Marginalia ───────────────────────────────────────────────────────────
     `(marginalia-documentation          ((,class (:foreground ,grey1 :slant italic))))
     `(marginalia-file-name              ((,class (:foreground ,fg1))))
     `(marginalia-file-modes             ((,class (:foreground ,grey0))))
     `(marginalia-file-owner             ((,class (:foreground ,grey1))))
     `(marginalia-key                    ((,class (:foreground ,orange))))
     `(marginalia-type                   ((,class (:foreground ,blue))))
     `(marginalia-value                  ((,class (:foreground ,fg0))))
     `(marginalia-date                   ((,class (:foreground ,aqua))))
     `(marginalia-number                 ((,class (:foreground ,purple))))
     `(marginalia-string                 ((,class (:foreground ,green))))
     `(marginalia-on                     ((,class (:foreground ,green :weight bold))))
     `(marginalia-off                    ((,class (:foreground ,red :weight bold))))

     ;; ── Consult ──────────────────────────────────────────────────────────────
     `(consult-file                      ((,class (:foreground ,blue))))
     `(consult-separator                 ((,class (:foreground ,grey0))))
     `(consult-preview-cursor            ((,class (:background ,bg3))))
     `(consult-preview-error             ((,class (:background ,bg-diff-red))))
     `(consult-preview-insertion         ((,class (:background ,bg-diff-green))))
     `(consult-line-number               ((,class (:foreground ,grey0))))
     `(consult-line-number-prefix        ((,class (:foreground ,grey0))))
     `(consult-grep-context              ((,class (:foreground ,grey1))))
     `(consult-async-running             ((,class (:foreground ,yellow))))
     `(consult-async-failed              ((,class (:foreground ,red))))
     `(consult-async-finished            ((,class (:foreground ,green))))
     `(consult-async-split               ((,class (:foreground ,grey0))))

     ;; ── Embark ───────────────────────────────────────────────────────────────
     `(embark-target                     ((,class (:foreground ,fg0 :background ,bg-current-word :underline t))))
     `(embark-collect-marked             ((,class (:foreground ,orange :background ,bg3))))
     `(embark-collect-candidate          ((,class (:foreground ,fg0))))
     `(embark-selected                   ((,class (:background ,bg3))))

     ;; ── Ivy ──────────────────────────────────────────────────────────────────
     `(ivy-current-match                 ((,class (:foreground ,fg0 :background ,bg3 :weight bold :extend t))))
     `(ivy-minibuffer-match-face-1       ((,class (:foreground ,grey1))))
     `(ivy-minibuffer-match-face-2       ((,class (:foreground ,orange :weight bold))))
     `(ivy-minibuffer-match-face-3       ((,class (:foreground ,blue :weight bold))))
     `(ivy-minibuffer-match-face-4       ((,class (:foreground ,purple :weight bold))))
     `(ivy-confirm-face                  ((,class (:foreground ,green))))
     `(ivy-match-required-face           ((,class (:foreground ,red))))
     `(ivy-virtual                       ((,class (:foreground ,grey1 :slant italic))))
     `(ivy-subdir                        ((,class (:foreground ,blue :weight bold))))
     `(ivy-org                           ((,class (:foreground ,fg1))))
     `(ivy-separator                     ((,class (:foreground ,grey0))))
     `(ivy-action                        ((,class (:foreground ,orange))))
     `(ivy-prompt-match                  ((,class (:foreground ,fg0 :background ,bg-visual-yellow))))

     ;; ── Xref ─────────────────────────────────────────────────────────────────
     `(xref-match                        ((,class (:foreground ,bg0 :background ,bg-green))))
     `(xref-file-header                  ((,class (:foreground ,orange :weight bold))))
     `(xref-line-number                  ((,class (:foreground ,grey0))))

     ;; ── Info ─────────────────────────────────────────────────────────────────
     `(info-menu-header                  ((,class (:foreground ,orange :weight bold))))
     `(info-menu-star                    ((,class (:foreground ,red))))
     `(info-node                         ((,class (:foreground ,orange :weight bold :slant italic))))
     `(info-title-1                      ((,class (:foreground ,orange :weight bold :height 1.4))))
     `(info-title-2                      ((,class (:foreground ,yellow :weight bold :height 1.3))))
     `(info-title-3                      ((,class (:foreground ,blue :weight bold :height 1.2))))
     `(info-title-4                      ((,class (:foreground ,fg0 :weight bold :height 1.1))))
     `(info-xref                         ((,class (:foreground ,blue :underline t))))
     `(info-xref-visited                 ((,class (:foreground ,purple :underline t))))
     `(info-index-match                  ((,class (:foreground ,fg0 :background ,bg-visual-yellow))))
     `(info-header-xref                  ((,class (:foreground ,blue :underline t))))

     ;; ── Help ─────────────────────────────────────────────────────────────────
     `(help-argument-name                ((,class (:foreground ,orange :slant italic))))
     `(help-key-binding                  ((,class (:foreground ,fg0 :background ,bg3 :box (:line-width -1 :color ,grey0)))))

     ;; ── Helpful ──────────────────────────────────────────────────────────────
     `(helpful-heading                   ((,class (:foreground ,orange :weight bold))))

     ;; ── Describe ─────────────────────────────────────────────────────────────
     `(describe-variable-value           ((,class (:foreground ,green))))

     ;; ── Eldoc ────────────────────────────────────────────────────────────────
     `(eldoc-highlight-function-argument ((,class (:foreground ,bg0 :background ,bg-green))))

     ;; ── Dired ────────────────────────────────────────────────────────────────
     `(dired-directory                   ((,class (:foreground ,blue :weight bold))))
     `(dired-flagged                     ((,class (:foreground ,red :weight bold))))
     `(dired-header                      ((,class (:foreground ,orange :weight bold))))
     `(dired-ignored                     ((,class (:foreground ,grey0))))
     `(dired-mark                        ((,class (:foreground ,orange))))
     `(dired-marked                      ((,class (:foreground ,yellow :weight bold))))
     `(dired-perm-write                  ((,class (:foreground ,yellow))))
     `(dired-set-id                      ((,class (:foreground ,red))))
     `(dired-special                     ((,class (:foreground ,purple))))
     `(dired-symlink                     ((,class (:foreground ,aqua :slant italic))))
     `(dired-warning                     ((,class (:foreground ,yellow :weight bold))))
     `(dired-broken-symlink              ((,class (:foreground ,red :slant italic :strike-through t))))
     `(diredfl-dir-name                  ((,class (:foreground ,blue :weight bold))))
     `(diredfl-dir-heading               ((,class (:foreground ,orange :weight bold))))
     `(diredfl-dir-priv                  ((,class (:foreground ,blue))))
     `(diredfl-exec-priv                 ((,class (:foreground ,green))))
     `(diredfl-file-name                 ((,class (:foreground ,fg0))))
     `(diredfl-file-suffix               ((,class (:foreground ,grey1))))
     `(diredfl-flag-mark                 ((,class (:foreground ,orange :weight bold))))
     `(diredfl-flag-mark-line            ((,class (:background ,bg3 :extend t))))
     `(diredfl-ignored-file-name         ((,class (:foreground ,grey0))))
     `(diredfl-link-priv                 ((,class (:foreground ,aqua))))
     `(diredfl-no-priv                   ((,class (:foreground ,grey0))))
     `(diredfl-number                    ((,class (:foreground ,purple))))
     `(diredfl-read-priv                 ((,class (:foreground ,yellow))))
     `(diredfl-symlink                   ((,class (:foreground ,aqua :slant italic))))
     `(diredfl-write-priv                ((,class (:foreground ,red))))

     ;; ── Ibuffer ──────────────────────────────────────────────────────────────
     `(ibuffer-locked-buffer             ((,class (:foreground ,yellow))))
     `(ibuffer-filter-group-name         ((,class (:foreground ,orange :weight bold))))
     `(ibuffer-deletion                  ((,class (:foreground ,red))))
     `(ibuffer-marked                    ((,class (:foreground ,yellow :weight bold))))

     ;; ── Treemacs / Neotree ───────────────────────────────────────────────────
     `(treemacs-root-face                ((,class (:foreground ,orange :weight bold :height 1.1))))
     `(treemacs-directory-face           ((,class (:foreground ,blue :weight bold))))
     `(treemacs-file-face                ((,class (:foreground ,fg0))))
     `(treemacs-git-modified-face        ((,class (:foreground ,yellow))))
     `(treemacs-git-renamed-face         ((,class (:foreground ,aqua))))
     `(treemacs-git-ignored-face         ((,class (:foreground ,grey0))))
     `(treemacs-git-untracked-face       ((,class (:foreground ,grey1))))
     `(treemacs-git-added-face           ((,class (:foreground ,green))))
     `(treemacs-git-conflict-face        ((,class (:foreground ,red :weight bold))))
     `(treemacs-tags-face                ((,class (:foreground ,grey1))))
     `(neo-root-dir-face                 ((,class (:foreground ,orange :weight bold))))
     `(neo-dir-link-face                 ((,class (:foreground ,blue :weight bold))))
     `(neo-file-link-face                ((,class (:foreground ,fg0))))
     `(neo-expand-btn-face               ((,class (:foreground ,grey1))))
     `(neo-banner-face                   ((,class (:foreground ,orange))))

     ;; ── Magit ────────────────────────────────────────────────────────────────
     `(magit-section-heading             ((,class (:foreground ,orange :weight bold))))
     `(magit-section-heading-selection   ((,class (:foreground ,yellow :weight bold))))
     `(magit-section-highlight           ((,class (:background ,bg-current-word :extend t))))
     `(magit-section-secondary-heading   ((,class (:foreground ,fg1 :weight bold))))
     `(magit-diff-added                  ((,class (:foreground ,green :background ,bg-diff-green :extend t))))
     `(magit-diff-removed                ((,class (:foreground ,red :background ,bg-diff-red :extend t))))
     `(magit-diff-base                   ((,class (:foreground ,yellow :background ,bg-diff-blue :extend t))))
     `(magit-diff-added-highlight        ((,class (:foreground ,green :background ,bg-visual-green :extend t))))
     `(magit-diff-removed-highlight      ((,class (:foreground ,red :background ,bg-visual-red :extend t))))
     `(magit-diff-base-highlight         ((,class (:foreground ,yellow :background ,bg-visual-blue :extend t))))
     `(magit-diff-context                ((,class (:foreground ,grey1 :extend t))))
     `(magit-diff-context-highlight      ((,class (:foreground ,fg1 :background ,bg-current-word :extend t))))
     `(magit-diff-hunk-heading           ((,class (:foreground ,aqua :background ,bg-diff-blue :extend t))))
     `(magit-diff-hunk-heading-highlight ((,class (:foreground ,aqua :background ,bg-visual-blue :weight bold :extend t))))
     `(magit-diff-hunk-heading-selection ((,class (:foreground ,fg0 :background ,bg-current-word :extend t))))
     `(magit-diff-hunk-region            ((,class (:extend t))))
     `(magit-diff-lines-heading          ((,class (:foreground ,fg0 :background ,bg3 :extend t))))
     `(magit-diff-lines-boundary         ((,class (:background ,bg3 :extend t))))
     `(magit-diff-whitespace-warning     ((,class (:background ,bg-diff-red))))
     `(magit-diffstat-added              ((,class (:foreground ,green))))
     `(magit-diffstat-removed            ((,class (:foreground ,red))))
     `(magit-branch-local                ((,class (:foreground ,blue))))
     `(magit-branch-remote               ((,class (:foreground ,green))))
     `(magit-branch-remote-head          ((,class (:foreground ,green :box t))))
     `(magit-branch-current              ((,class (:foreground ,blue :box t))))
     `(magit-branch-upstream             ((,class (:foreground ,grey1 :slant italic))))
     `(magit-branch-warning              ((,class (:foreground ,yellow :weight bold))))
     `(magit-tag                         ((,class (:foreground ,yellow))))
     `(magit-hash                        ((,class (:foreground ,grey0))))
     `(magit-filename                    ((,class (:foreground ,fg0))))
     `(magit-log-author                  ((,class (:foreground ,orange))))
     `(magit-log-date                    ((,class (:foreground ,grey1))))
     `(magit-log-graph                   ((,class (:foreground ,grey0))))
     `(magit-log-head-label-head         ((,class (:foreground ,bg0 :background ,orange :weight bold))))
     `(magit-process-ok                  ((,class (:foreground ,green :weight bold))))
     `(magit-process-ng                  ((,class (:foreground ,red :weight bold))))
     `(magit-reflog-commit               ((,class (:foreground ,green))))
     `(magit-reflog-amend                ((,class (:foreground ,purple))))
     `(magit-reflog-merge                ((,class (:foreground ,aqua))))
     `(magit-reflog-checkout             ((,class (:foreground ,blue))))
     `(magit-reflog-reset                ((,class (:foreground ,red))))
     `(magit-reflog-rebase               ((,class (:foreground ,purple))))
     `(magit-reflog-cherry-pick          ((,class (:foreground ,green))))
     `(magit-reflog-remote               ((,class (:foreground ,aqua))))
     `(magit-reflog-other                ((,class (:foreground ,grey1))))
     `(magit-signature-good              ((,class (:foreground ,green))))
     `(magit-signature-bad               ((,class (:foreground ,red :weight bold))))
     `(magit-signature-untrusted         ((,class (:foreground ,yellow))))
     `(magit-signature-expired           ((,class (:foreground ,yellow))))
     `(magit-signature-revoked           ((,class (:foreground ,red))))
     `(magit-signature-error             ((,class (:foreground ,red))))
     `(magit-cherry-equivalent           ((,class (:foreground ,aqua))))
     `(magit-cherry-unmatched            ((,class (:foreground ,purple))))
     `(magit-blame-heading               ((,class (:foreground ,fg1 :background ,bg1 :extend t))))
     `(magit-blame-hash                  ((,class (:foreground ,orange :background ,bg1))))
     `(magit-blame-name                  ((,class (:foreground ,yellow :background ,bg1))))
     `(magit-blame-date                  ((,class (:foreground ,grey1 :background ,bg1))))
     `(magit-blame-summary               ((,class (:foreground ,fg0 :background ,bg1))))
     `(magit-blame-margin                ((,class (:foreground ,grey1 :background ,bg1))))
     `(magit-blame-dimmed                ((,class (:foreground ,grey0 :background ,bg1))))

     ;; ── Git commit ───────────────────────────────────────────────────────────
     `(git-commit-summary                ((,class (:foreground ,fg0 :weight bold))))
     `(git-commit-overlong-summary       ((,class (:foreground ,red :underline t))))
     `(git-commit-nonempty-second-line   ((,class (:foreground ,red :underline t))))
     `(git-commit-comment-heading        ((,class (:foreground ,orange :weight bold))))
     `(git-commit-comment-action         ((,class (:foreground ,green))))
     `(git-commit-comment-branch-local   ((,class (:foreground ,blue))))
     `(git-commit-comment-branch-remote  ((,class (:foreground ,green))))
     `(git-commit-comment-file           ((,class (:foreground ,orange))))
     `(git-commit-keyword                ((,class (:foreground ,purple))))
     `(git-commit-trailer-token          ((,class (:foreground ,blue))))
     `(git-commit-trailer-value          ((,class (:foreground ,fg0))))

     ;; ── Git rebase ───────────────────────────────────────────────────────────
     `(git-rebase-pick                   ((,class (:foreground ,green))))
     `(git-rebase-reword                 ((,class (:foreground ,blue))))
     `(git-rebase-edit                   ((,class (:foreground ,yellow))))
     `(git-rebase-squash                 ((,class (:foreground ,purple))))
     `(git-rebase-fixup                  ((,class (:foreground ,yellow))))
     `(git-rebase-exec                   ((,class (:foreground ,aqua))))
     `(git-rebase-kill-line              ((,class (:foreground ,red :strike-through t))))
     `(git-rebase-hash                   ((,class (:foreground ,grey0))))
     `(git-rebase-description            ((,class (:foreground ,fg0))))
     `(git-rebase-label                  ((,class (:foreground ,grey1))))

     ;; ── Forge ────────────────────────────────────────────────────────────────
     `(forge-topic-label                 ((,class (:box t))))
     `(forge-pullreq-open                ((,class (:foreground ,green))))
     `(forge-pullreq-merged              ((,class (:foreground ,purple))))
     `(forge-pullreq-closed              ((,class (:foreground ,red))))
     `(forge-issue-open                  ((,class (:foreground ,green))))
     `(forge-issue-closed                ((,class (:foreground ,grey0))))
     `(forge-issue-completed             ((,class (:foreground ,grey0 :strike-through t))))
     `(forge-post-author                 ((,class (:foreground ,orange :weight bold))))

     ;; ── Transient ────────────────────────────────────────────────────────────
     `(transient-heading                 ((,class (:foreground ,orange :weight bold))))
     `(transient-key                     ((,class (:foreground ,aqua :weight bold))))
     `(transient-argument                ((,class (:foreground ,yellow :weight bold))))
     `(transient-value                   ((,class (:foreground ,green))))
     `(transient-inactive-argument       ((,class (:foreground ,grey0))))
     `(transient-inactive-value          ((,class (:foreground ,grey0))))
     `(transient-enabled-suffix          ((,class (:foreground ,green :weight bold))))
     `(transient-disabled-suffix         ((,class (:foreground ,red :weight bold))))
     `(transient-inapt-suffix            ((,class (:foreground ,grey0 :slant italic))))
     `(transient-mismatched-key          ((,class (:foreground ,red :underline t))))
     `(transient-nonstandard-key         ((,class (:foreground ,yellow :underline t))))
     `(transient-unreachable             ((,class (:foreground ,grey0))))
     `(transient-unreachable-key         ((,class (:foreground ,grey0 :underline t))))
     `(transient-separator               ((,class (:foreground ,grey0 :strike-through t :extend t))))
     `(transient-amaranth                ((,class (:foreground ,red :weight bold))))
     `(transient-blue                    ((,class (:foreground ,blue :weight bold))))
     `(transient-pink                    ((,class (:foreground ,purple :weight bold))))
     `(transient-purple                  ((,class (:foreground ,purple :weight bold))))
     `(transient-teal                    ((,class (:foreground ,aqua :weight bold))))
     `(transient-red                     ((,class (:foreground ,red :weight bold))))

     ;; ── Which-key ────────────────────────────────────────────────────────────
     `(which-key-key-face                ((,class (:foreground ,orange :weight bold))))
     `(which-key-separator-face          ((,class (:foreground ,grey0))))
     `(which-key-note-face               ((,class (:foreground ,grey1 :slant italic))))
     `(which-key-command-description-face ((,class (:foreground ,fg0))))
     `(which-key-group-description-face  ((,class (:foreground ,blue :weight bold))))
     `(which-key-highlighted-command-face ((,class (:foreground ,orange :underline t))))
     `(which-key-local-map-description-face ((,class (:foreground ,green))))
     `(which-key-special-key-face        ((,class (:foreground ,purple :weight bold))))
     `(which-key-docstring-face          ((,class (:foreground ,grey1 :slant italic))))

     ;; ── Hydra ────────────────────────────────────────────────────────────────
     `(hydra-face-red                    ((,class (:foreground ,red :weight bold))))
     `(hydra-face-blue                   ((,class (:foreground ,blue :weight bold))))
     `(hydra-face-amaranth               ((,class (:foreground ,yellow :weight bold))))
     `(hydra-face-pink                   ((,class (:foreground ,purple :weight bold))))
     `(hydra-face-teal                   ((,class (:foreground ,aqua :weight bold))))

     ;; ── Avy ──────────────────────────────────────────────────────────────────
     `(avy-lead-face                     ((,class (:foreground ,bg0 :background ,orange :weight bold))))
     `(avy-lead-face-0                   ((,class (:foreground ,bg0 :background ,blue :weight bold))))
     `(avy-lead-face-1                   ((,class (:foreground ,bg0 :background ,grey1 :weight bold))))
     `(avy-lead-face-2                   ((,class (:foreground ,bg0 :background ,purple :weight bold))))
     `(avy-background-face               ((,class (:foreground ,grey0))))

     ;; ── hl-todo ──────────────────────────────────────────────────────────────
     `(hl-todo                           ((,class (:weight bold :slant italic))))

     ;; ── Pulsar / Pulse ───────────────────────────────────────────────────────
     `(pulsar-red                        ((,class (:background ,bg-diff-red :extend t))))
     `(pulsar-green                      ((,class (:background ,bg-diff-green :extend t))))
     `(pulsar-yellow                     ((,class (:background ,bg-visual-blue :extend t))))
     `(pulsar-blue                       ((,class (:background ,bg-diff-blue :extend t))))
     `(pulsar-cyan                       ((,class (:background ,bg-diff-blue :extend t))))
     `(pulsar-magenta                    ((,class (:background ,bg-diff-red :extend t))))
     `(pulse-highlight-start-face        ((,class (:background ,bg-visual-yellow :extend t))))
     `(pulse-highlight-face              ((,class (:background ,bg-current-word :extend t))))

     ;; ── Org mode ─────────────────────────────────────────────────────────────
     `(org-level-1                       ((,class (:foreground ,red :weight bold))))
     `(org-level-2                       ((,class (:foreground ,orange :weight bold))))
     `(org-level-3                       ((,class (:foreground ,yellow :weight bold))))
     `(org-level-4                       ((,class (:foreground ,green :weight bold))))
     `(org-level-5                       ((,class (:foreground ,blue :weight bold))))
     `(org-level-6                       ((,class (:foreground ,purple :weight bold))))
     `(org-level-7                       ((,class (:foreground ,aqua :weight bold))))
     `(org-level-8                       ((,class (:foreground ,grey2 :weight bold))))
     `(org-document-title                ((,class (:foreground ,red :weight bold))))
     `(org-document-info                 ((,class (:foreground ,grey1))))
     `(org-document-info-keyword         ((,class (:foreground ,grey0))))
     `(org-block                         ((,class (:foreground ,fg0 :background ,bg1 :extend t))))
     `(org-block-begin-line              ((,class (:foreground ,grey0 :background ,bg1 :slant italic :extend t))))
     `(org-block-end-line                ((,class (:foreground ,grey0 :background ,bg1 :slant italic :extend t))))
     `(org-code                          ((,class (:foreground ,green :background ,bg1))))
     `(org-verbatim                      ((,class (:foreground ,aqua :background ,bg1))))
     `(org-meta-line                     ((,class (:foreground ,grey0))))
     `(org-drawer                        ((,class (:foreground ,grey0))))
     `(org-property-value                ((,class (:foreground ,grey1))))
     `(org-special-keyword               ((,class (:foreground ,yellow))))
     `(org-tag                           ((,class (:foreground ,grey0 :weight bold))))
     `(org-tag-group                     ((,class (:foreground ,grey1 :weight bold))))
     `(org-ellipsis                      ((,class (:foreground ,grey0 :underline nil))))
     `(org-hide                          ((,class (:foreground ,bg0))))
     `(org-link                          ((,class (:foreground ,blue :underline t))))
     `(org-footnote                      ((,class (:foreground ,aqua :underline t))))
     `(org-target                        ((,class (:foreground ,grey1 :underline t))))
     `(org-date                          ((,class (:foreground ,aqua))))
     `(org-date-selected                 ((,class (:foreground ,bg0 :background ,aqua))))
     `(org-sexp-date                     ((,class (:foreground ,aqua))))
     `(org-time-grid                     ((,class (:foreground ,grey0))))
     `(org-todo                          ((,class (:foreground ,red :weight bold))))
     `(org-done                          ((,class (:foreground ,green :weight bold))))
     `(org-headline-todo                 ((,class (:foreground ,fg0))))
     `(org-headline-done                 ((,class (:foreground ,grey1 :strike-through t))))
     `(org-priority                      ((,class (:foreground ,purple))))
     `(org-checkbox                      ((,class (:foreground ,yellow :weight bold))))
     `(org-checkbox-statistics-todo      ((,class (:foreground ,yellow :weight bold))))
     `(org-checkbox-statistics-done      ((,class (:foreground ,green :weight bold))))
     `(org-table                         ((,class (:foreground ,blue))))
     `(org-table-header                  ((,class (:foreground ,fg0 :background ,bg3 :weight bold))))
     `(org-formula                       ((,class (:foreground ,yellow))))
     `(org-list-dt                       ((,class (:foreground ,yellow :weight bold))))
     `(org-scheduled                     ((,class (:foreground ,green))))
     `(org-scheduled-previously          ((,class (:foreground ,yellow))))
     `(org-scheduled-today               ((,class (:foreground ,green))))
     `(org-upcoming-deadline             ((,class (:foreground ,yellow))))
     `(org-imminent-deadline             ((,class (:foreground ,red :weight bold))))
     `(org-warning                       ((,class (:foreground ,yellow :weight bold))))
     `(org-default                       ((,class (:foreground ,fg0 :background ,bg0))))
     `(org-quote                         ((,class (:foreground ,fg1 :background ,bg1 :slant italic :extend t))))
     `(org-verse                         ((,class (:foreground ,fg1 :background ,bg1 :slant italic :extend t))))
     `(org-latex-and-related             ((,class (:foreground ,purple))))
     `(org-macro                         ((,class (:foreground ,orange))))
     `(org-mode-line-clock               ((,class (:foreground ,fg1))))
     `(org-mode-line-clock-overrun       ((,class (:foreground ,red :weight bold))))

     ;; ── Org Agenda ───────────────────────────────────────────────────────────
     `(org-agenda-structure              ((,class (:foreground ,orange :weight bold))))
     `(org-agenda-structure-filter       ((,class (:foreground ,yellow))))
     `(org-agenda-date                   ((,class (:foreground ,blue :weight bold))))
     `(org-agenda-date-today             ((,class (:foreground ,orange :weight bold :underline t))))
     `(org-agenda-date-weekend           ((,class (:foreground ,grey1))))
     `(org-agenda-date-weekend-today     ((,class (:foreground ,yellow :underline t))))
     `(org-agenda-current-time           ((,class (:foreground ,yellow :weight bold))))
     `(org-agenda-done                   ((,class (:foreground ,grey1 :strike-through t))))
     `(org-agenda-dimmed-todo-face       ((,class (:foreground ,grey0))))
     `(org-agenda-restriction-lock       ((,class (:foreground ,bg0 :background ,yellow))))
     `(org-agenda-clocking               ((,class (:foreground ,fg0 :background ,bg3))))
     `(org-agenda-diary                  ((,class (:foreground ,grey1))))
     `(org-agenda-calendar-event         ((,class (:foreground ,fg0))))
     `(org-agenda-calendar-sexp          ((,class (:foreground ,grey1))))
     `(org-agenda-filter-category        ((,class (:foreground ,yellow :weight bold))))
     `(org-agenda-filter-regexp          ((,class (:foreground ,yellow :weight bold))))
     `(org-agenda-filter-tags            ((,class (:foreground ,yellow :weight bold))))
     `(org-agenda-filter-effort          ((,class (:foreground ,yellow :weight bold))))
     `(org-agenda-column-dateline        ((,class (:foreground ,aqua))))

     ;; ── Org Roam ─────────────────────────────────────────────────────────────
     `(org-roam-link                     ((,class (:foreground ,blue :underline t))))
     `(org-roam-link-current             ((,class (:foreground ,orange :underline t))))
     `(org-roam-link-invalid             ((,class (:foreground ,red :underline t))))
     `(org-roam-header-line              ((,class (:foreground ,orange :weight bold))))
     `(org-roam-olp                      ((,class (:foreground ,grey1 :slant italic))))
     `(org-roam-preview-heading          ((,class (:foreground ,yellow :weight bold))))

     ;; ── Markdown ─────────────────────────────────────────────────────────────
     `(markdown-header-face              ((,class (:foreground ,red :weight bold))))
     `(markdown-header-face-1            ((,class (:foreground ,red :weight bold))))
     `(markdown-header-face-2            ((,class (:foreground ,orange :weight bold))))
     `(markdown-header-face-3            ((,class (:foreground ,yellow :weight bold))))
     `(markdown-header-face-4            ((,class (:foreground ,green :weight bold))))
     `(markdown-header-face-5            ((,class (:foreground ,blue :weight bold))))
     `(markdown-header-face-6            ((,class (:foreground ,purple :weight bold))))
     `(markdown-header-delimiter-face    ((,class (:foreground ,grey0 :weight bold))))
     `(markdown-bold-face                ((,class (:weight bold))))
     `(markdown-italic-face              ((,class (:slant italic))))
     `(markdown-strike-through-face      ((,class (:foreground ,grey1 :strike-through t))))
     `(markdown-code-face                ((,class (:foreground ,aqua))))
     `(markdown-inline-code-face         ((,class (:foreground ,green))))
     `(markdown-pre-face                 ((,class (:foreground ,aqua))))
     `(markdown-language-keyword-face    ((,class (:foreground ,grey0))))
     `(markdown-blockquote-face          ((,class (:foreground ,grey1 :slant italic))))
     `(markdown-list-face                ((,class (:foreground ,yellow :weight bold))))
     `(markdown-link-face                ((,class (:foreground ,blue :underline t))))
     `(markdown-url-face                 ((,class (:foreground ,aqua :underline t))))
     `(markdown-plain-url-face           ((,class (:foreground ,aqua :underline t))))
     `(markdown-reference-face           ((,class (:foreground ,grey1))))
     `(markdown-footnote-marker-face     ((,class (:foreground ,purple))))
     `(markdown-footnote-text-face       ((,class (:foreground ,fg1))))
     `(markdown-table-face               ((,class (:foreground ,blue))))
     `(markdown-hr-face                  ((,class (:foreground ,grey0))))
     `(markdown-html-attr-name-face      ((,class (:foreground ,blue))))
     `(markdown-html-attr-value-face     ((,class (:foreground ,green))))
     `(markdown-html-tag-delimiter-face  ((,class (:foreground ,grey1))))
     `(markdown-html-tag-name-face       ((,class (:foreground ,orange))))
     `(markdown-math-face                ((,class (:foreground ,purple))))
     `(markdown-metadata-key-face        ((,class (:foreground ,grey1))))
     `(markdown-metadata-value-face      ((,class (:foreground ,fg1))))
     `(markdown-highlighting-face        ((,class (:background ,bg-visual-yellow))))

     ;; ── Shell / Terminal ─────────────────────────────────────────────────────
     `(comint-highlight-input            ((,class (:foreground ,fg0 :weight bold))))
     `(comint-highlight-prompt           ((,class (:foreground ,green :weight bold))))
     `(eshell-prompt                     ((,class (:foreground ,orange :weight bold))))
     `(eshell-ls-directory               ((,class (:foreground ,blue :weight bold))))
     `(eshell-ls-executable              ((,class (:foreground ,green))))
     `(eshell-ls-missing                 ((,class (:foreground ,red :weight bold))))
     `(eshell-ls-product                 ((,class (:foreground ,yellow))))
     `(eshell-ls-readonly                ((,class (:foreground ,grey1))))
     `(eshell-ls-special                 ((,class (:foreground ,purple))))
     `(eshell-ls-symlink                 ((,class (:foreground ,aqua))))
     `(eshell-ls-unreadable              ((,class (:foreground ,red))))
     `(eshell-ls-backup                  ((,class (:foreground ,grey0))))
     `(eshell-ls-clutter                 ((,class (:foreground ,grey0))))
     `(eshell-ls-archive                 ((,class (:foreground ,yellow))))
     `(vterm-color-default               ((,class (:foreground ,fg0 :background ,bg0))))
     `(vterm-color-black                 ((,class (:foreground ,term-black :background ,term-black))))
     `(vterm-color-red                   ((,class (:foreground ,red :background ,red))))
     `(vterm-color-green                 ((,class (:foreground ,green :background ,green))))
     `(vterm-color-yellow                ((,class (:foreground ,yellow :background ,yellow))))
     `(vterm-color-blue                  ((,class (:foreground ,blue :background ,blue))))
     `(vterm-color-magenta               ((,class (:foreground ,purple :background ,purple))))
     `(vterm-color-cyan                  ((,class (:foreground ,aqua :background ,aqua))))
     `(vterm-color-white                 ((,class (:foreground ,term-white :background ,term-white))))
     `(vterm-color-bright-black          ((,class (:foreground ,term-bright-black :background ,term-bright-black))))
     `(vterm-color-bright-red            ((,class (:foreground ,orange :background ,orange))))
     `(vterm-color-bright-green          ((,class (:foreground ,green :background ,green))))
     `(vterm-color-bright-yellow         ((,class (:foreground ,yellow :background ,yellow))))
     `(vterm-color-bright-blue           ((,class (:foreground ,blue :background ,blue))))
     `(vterm-color-bright-magenta        ((,class (:foreground ,purple :background ,purple))))
     `(vterm-color-bright-cyan           ((,class (:foreground ,aqua :background ,aqua))))
     `(vterm-color-bright-white          ((,class (:foreground ,term-bright-white :background ,term-bright-white))))

     ;; ── Ansi colors ──────────────────────────────────────────────────────────
     `(ansi-color-black                  ((,class (:foreground ,term-black :background ,term-black))))
     `(ansi-color-red                    ((,class (:foreground ,red :background ,red))))
     `(ansi-color-green                  ((,class (:foreground ,green :background ,green))))
     `(ansi-color-yellow                 ((,class (:foreground ,yellow :background ,yellow))))
     `(ansi-color-blue                   ((,class (:foreground ,blue :background ,blue))))
     `(ansi-color-magenta                ((,class (:foreground ,purple :background ,purple))))
     `(ansi-color-cyan                   ((,class (:foreground ,aqua :background ,aqua))))
     `(ansi-color-white                  ((,class (:foreground ,term-white :background ,term-white))))
     `(ansi-color-bright-black           ((,class (:foreground ,term-bright-black :background ,term-bright-black))))
     `(ansi-color-bright-red             ((,class (:foreground ,orange :background ,orange))))
     `(ansi-color-bright-green           ((,class (:foreground ,green :background ,green))))
     `(ansi-color-bright-yellow          ((,class (:foreground ,yellow :background ,yellow))))
     `(ansi-color-bright-blue            ((,class (:foreground ,blue :background ,blue))))
     `(ansi-color-bright-magenta         ((,class (:foreground ,purple :background ,purple))))
     `(ansi-color-bright-cyan            ((,class (:foreground ,aqua :background ,aqua))))
     `(ansi-color-bright-white           ((,class (:foreground ,term-bright-white :background ,term-bright-white))))

     ;; ── Calendar ─────────────────────────────────────────────────────────────
     `(calendar-today                    ((,class (:foreground ,orange :weight bold :underline t))))
     `(calendar-month-header             ((,class (:foreground ,orange :weight bold))))
     `(calendar-weekday-header           ((,class (:foreground ,blue))))
     `(calendar-weekend-header           ((,class (:foreground ,grey1))))
     `(diary                             ((,class (:foreground ,yellow))))
     `(holiday                           ((,class (:foreground ,red))))
     `(diary-anniversary                 ((,class (:foreground ,aqua))))

     ;; ── Message / Mail ───────────────────────────────────────────────────────
     `(message-header-name               ((,class (:foreground ,blue :weight bold))))
     `(message-header-to                 ((,class (:foreground ,fg0 :weight bold))))
     `(message-header-cc                 ((,class (:foreground ,fg1))))
     `(message-header-subject            ((,class (:foreground ,orange :weight bold))))
     `(message-header-other              ((,class (:foreground ,fg1))))
     `(message-header-newsgroups         ((,class (:foreground ,yellow :weight bold))))
     `(message-header-xheader            ((,class (:foreground ,grey1))))
     `(message-separator                 ((,class (:foreground ,grey0 :slant italic))))
     `(message-cited-text-1              ((,class (:foreground ,blue))))
     `(message-cited-text-2              ((,class (:foreground ,green))))
     `(message-cited-text-3              ((,class (:foreground ,purple))))
     `(message-cited-text-4              ((,class (:foreground ,aqua))))
     `(message-mml                       ((,class (:foreground ,grey1 :slant italic))))

     ;; ── Gnus ─────────────────────────────────────────────────────────────────
     `(gnus-group-mail-1                 ((,class (:foreground ,orange :weight bold))))
     `(gnus-group-mail-2                 ((,class (:foreground ,orange))))
     `(gnus-group-mail-3                 ((,class (:foreground ,fg1))))
     `(gnus-group-mail-1-empty           ((,class (:foreground ,grey1))))
     `(gnus-group-mail-2-empty           ((,class (:foreground ,grey1))))
     `(gnus-group-mail-3-empty           ((,class (:foreground ,grey0))))
     `(gnus-group-news-1                 ((,class (:foreground ,blue :weight bold))))
     `(gnus-group-news-2                 ((,class (:foreground ,blue))))
     `(gnus-group-news-3                 ((,class (:foreground ,fg1))))
     `(gnus-summary-selected             ((,class (:foreground ,fg0 :background ,bg3))))
     `(gnus-summary-normal-read          ((,class (:foreground ,grey1))))
     `(gnus-summary-normal-unread        ((,class (:foreground ,fg0 :weight bold))))
     `(gnus-summary-high-unread          ((,class (:foreground ,orange :weight bold))))
     `(gnus-summary-low-unread           ((,class (:foreground ,grey1 :slant italic))))
     `(gnus-header-name                  ((,class (:foreground ,blue :weight bold))))
     `(gnus-header-from                  ((,class (:foreground ,orange))))
     `(gnus-header-subject               ((,class (:foreground ,fg0 :weight bold))))
     `(gnus-header-content               ((,class (:foreground ,fg1))))

     ;; ── Notmuch ──────────────────────────────────────────────────────────────
     `(notmuch-search-date               ((,class (:foreground ,grey0))))
     `(notmuch-search-count              ((,class (:foreground ,grey0))))
     `(notmuch-search-subject            ((,class (:foreground ,fg0))))
     `(notmuch-search-matching-authors   ((,class (:foreground ,orange))))
     `(notmuch-search-non-matching-authors ((,class (:foreground ,grey1))))
     `(notmuch-search-flagged-face       ((,class (:foreground ,blue))))
     `(notmuch-search-unread-face        ((,class (:weight bold))))
     `(notmuch-tag-face                  ((,class (:foreground ,green))))
     `(notmuch-tag-unread                ((,class (:foreground ,yellow :weight bold))))
     `(notmuch-tag-flagged               ((,class (:foreground ,blue))))
     `(notmuch-tag-deleted               ((,class (:foreground ,red :strike-through t))))
     `(notmuch-tree-match-face           ((,class (:foreground ,fg0 :weight bold))))
     `(notmuch-tree-no-match-face        ((,class (:foreground ,grey1))))
     `(notmuch-message-summary-face      ((,class (:foreground ,grey1 :background ,bg1))))

     ;; ── Elfeed ───────────────────────────────────────────────────────────────
     `(elfeed-search-date-face           ((,class (:foreground ,grey0))))
     `(elfeed-search-feed-face           ((,class (:foreground ,blue))))
     `(elfeed-search-filter-face         ((,class (:foreground ,orange :weight bold))))
     `(elfeed-search-last-update-face    ((,class (:foreground ,grey0 :slant italic))))
     `(elfeed-search-tag-face            ((,class (:foreground ,green))))
     `(elfeed-search-title-face          ((,class (:foreground ,fg0))))
     `(elfeed-search-unread-title-face   ((,class (:foreground ,fg0 :weight bold))))
     `(elfeed-search-unread-count-face   ((,class (:foreground ,yellow :weight bold))))
     `(elfeed-log-error-level-face       ((,class (:foreground ,red))))
     `(elfeed-log-warn-level-face        ((,class (:foreground ,yellow))))
     `(elfeed-log-info-level-face        ((,class (:foreground ,blue))))
     `(elfeed-log-debug-level-face       ((,class (:foreground ,grey1))))

     ;; ── EWW ──────────────────────────────────────────────────────────────────
     `(eww-valid-certificate             ((,class (:foreground ,green :weight bold))))
     `(eww-invalid-certificate           ((,class (:foreground ,red :weight bold))))
     `(eww-form-checkbox                 ((,class (:foreground ,fg0 :background ,bg3 :box t))))
     `(eww-form-file                     ((,class (:foreground ,fg0 :background ,bg3 :box t))))
     `(eww-form-select                   ((,class (:foreground ,fg0 :background ,bg3 :box t))))
     `(eww-form-submit                   ((,class (:foreground ,fg0 :background ,bg3 :weight bold :box t))))
     `(eww-form-text                     ((,class (:foreground ,fg0 :background ,bg3 :box t))))
     `(eww-form-textarea                 ((,class (:foreground ,fg0 :background ,bg3 :box t))))
     `(shr-link                          ((,class (:foreground ,blue :underline t))))
     `(shr-visited-link                  ((,class (:foreground ,purple :underline t))))
     `(shr-selected-link                 ((,class (:foreground ,bg0 :background ,blue))))
     `(shr-strike-through                ((,class (:foreground ,grey1 :strike-through t))))
     `(shr-abbreviation                  ((,class (:underline (:style dots :color ,grey1)))))
     `(shr-h1                            ((,class (:foreground ,orange :weight bold))))
     `(shr-h2                            ((,class (:foreground ,yellow :weight bold))))
     `(shr-h3                            ((,class (:foreground ,blue :weight bold))))
     `(shr-h4                            ((,class (:foreground ,fg0 :weight bold))))
     `(shr-h5                            ((,class (:foreground ,fg1 :weight bold))))
     `(shr-h6                            ((,class (:foreground ,grey1 :weight bold))))
     `(shr-code                          ((,class (:foreground ,green :background ,bg1))))

     ;; ── CIDER ────────────────────────────────────────────────────────────────
     `(cider-result-overlay-face         ((,class (:foreground ,fg0 :background ,bg3 :box (:line-width -1 :color ,grey0)))))
     `(cider-debug-code-overlay-face     ((,class (:background ,bg-current-word))))
     `(cider-error-highlight-face        ((,class (:underline (:style wave :color ,red)))))
     `(cider-warning-highlight-face      ((,class (:underline (:style wave :color ,yellow)))))
     `(cider-repl-prompt-face            ((,class (:foreground ,green :weight bold))))
     `(cider-repl-input-face             ((,class (:weight bold))))
     `(cider-repl-output-face            ((,class (:foreground ,fg1))))
     `(cider-repl-stderr-face            ((,class (:foreground ,red))))
     `(cider-test-success-face           ((,class (:foreground ,bg0 :background ,green))))
     `(cider-test-failure-face           ((,class (:foreground ,bg0 :background ,red))))
     `(cider-test-error-face             ((,class (:foreground ,bg0 :background ,yellow))))
     `(cider-test-skipped-face           ((,class (:foreground ,bg0 :background ,grey1))))
     `(cider-fringe-good-face            ((,class (:foreground ,green))))
     `(cider-enlightened-face            ((,class (:foreground ,yellow :box (:line-width -1 :color ,yellow)))))
     `(cider-enlightened-local-face      ((,class (:foreground ,yellow :weight bold))))
     `(cider-traced-face                 ((,class (:box (:line-width -1 :color ,aqua)))))
     `(cider-stacktrace-error-message-face ((,class (:foreground ,red))))
     `(cider-stacktrace-filter-active-face ((,class (:foreground ,fg0 :underline t))))
     `(cider-stacktrace-filter-inactive-face ((,class (:foreground ,grey1))))

     ;; ── SLIME / SLY ──────────────────────────────────────────────────────────
     `(slime-repl-prompt-face            ((,class (:foreground ,green :weight bold))))
     `(slime-repl-output-face            ((,class (:foreground ,fg1))))
     `(slime-repl-inputed-output-face    ((,class (:foreground ,grey1))))
     `(slime-error-face                  ((,class (:underline (:style wave :color ,red)))))
     `(slime-warning-face                ((,class (:underline (:style wave :color ,yellow)))))
     `(slime-style-warning-face          ((,class (:underline (:style wave :color ,blue)))))
     `(slime-note-face                   ((,class (:underline (:style wave :color ,green)))))
     `(sly-mrepl-prompt-face             ((,class (:foreground ,green :weight bold))))
     `(sly-mrepl-output-face             ((,class (:foreground ,fg1))))
     `(sly-mrepl-note-face               ((,class (:foreground ,grey0))))
     `(sly-stickers-placed-face          ((,class (:background ,bg-current-word))))

     ;; ── Package menu ─────────────────────────────────────────────────────────
     `(package-name                      ((,class (:foreground ,blue))))
     `(package-description               ((,class (:foreground ,fg1))))
     `(package-status-available          ((,class (:foreground ,green))))
     `(package-status-avail-obso         ((,class (:foreground ,grey1))))
     `(package-status-installed          ((,class (:foreground ,fg0 :weight bold))))
     `(package-status-dependency         ((,class (:foreground ,blue))))
     `(package-status-built-in           ((,class (:foreground ,grey1))))
     `(package-status-new                ((,class (:foreground ,orange :weight bold))))
     `(package-status-held               ((,class (:foreground ,yellow))))
     `(package-status-external           ((,class (:foreground ,aqua))))
     `(package-status-incompat           ((,class (:foreground ,red))))
     `(package-status-disabled           ((,class (:foreground ,grey0 :strike-through t))))

     ;; ── Custom / Customize ───────────────────────────────────────────────────
     `(custom-group-tag                  ((,class (:foreground ,orange :weight bold))))
     `(custom-group-tag-1                ((,class (:foreground ,blue :weight bold))))
     `(custom-variable-tag               ((,class (:foreground ,yellow :weight bold))))
     `(custom-variable-obsolete          ((,class (:foreground ,grey1 :strike-through t))))
     `(custom-state                      ((,class (:foreground ,green))))
     `(custom-changed                    ((,class (:foreground ,yellow))))
     `(custom-modified                   ((,class (:foreground ,yellow :weight bold))))
     `(custom-set                        ((,class (:foreground ,blue))))
     `(custom-themed                     ((,class (:foreground ,blue))))
     `(custom-saved                      ((,class (:foreground ,green :weight bold))))
     `(custom-rogue                      ((,class (:foreground ,red :background ,bg3))))
     `(custom-invalid                    ((,class (:foreground ,bg0 :background ,red))))
     `(custom-comment                    ((,class (:foreground ,grey1 :background ,bg1))))
     `(custom-comment-tag                ((,class (:foreground ,grey1))))
     `(custom-button                     ((,class (:foreground ,fg0 :background ,bg3 :box t))))
     `(custom-button-mouse               ((,class (:foreground ,fg0 :background ,bg-current-word :box t))))
     `(custom-button-pressed             ((,class (:foreground ,bg0 :background ,orange :box t))))
     `(custom-documentation              ((,class (:slant italic))))
     `(widget-field                      ((,class (:foreground ,fg0 :background ,bg3))))
     `(widget-button                     ((,class (:foreground ,blue :weight bold))))
     `(widget-button-pressed             ((,class (:foreground ,orange))))
     `(widget-documentation              ((,class (:foreground ,grey1 :slant italic))))
     `(widget-inactive                   ((,class (:foreground ,grey0))))
     `(widget-single-line-field          ((,class (:foreground ,fg0 :background ,bg3)))))))

(provide 'gruvbox-material)

;;; gruvbox-material.el ends here
