;;; gruvbox-material-test.el --- Tests for gruvbox-material -*- lexical-binding: t -*-

;; SPDX-License-Identifier: MIT

;;; Commentary:

;; Run with "make test".

;;; Code:

(require 'ert)
(require 'seq)
(require 'gruvbox-material)

(defconst gruvbox-material-test--themes
  '((gruvbox-material-dark-hard    dark  hard)
    (gruvbox-material-dark-medium  dark  medium)
    (gruvbox-material-dark-soft    dark  soft)
    (gruvbox-material-light-hard   light hard)
    (gruvbox-material-light-medium light medium)
    (gruvbox-material-light-soft   light soft))
  "Each theme with its background and contrast.")

(defun gruvbox-material-test--upstream (background contrast)
  "Return the palette for BACKGROUND and CONTRAST without saturation."
  (append (alist-get contrast (alist-get background gruvbox-material-backgrounds))
          (alist-get background gruvbox-material-foregrounds)
          (alist-get background gruvbox-material-greys)))

(defun gruvbox-material-test--face-attr (theme face attr)
  "Return attribute ATTR of FACE as THEME sets it."
  (let ((setting (seq-find (lambda (s)
                             (and (eq (car s) 'theme-face)
                                  (eq (nth 1 s) face)))
                           (get theme 'theme-settings))))
    (plist-get (cadr (car (nth 3 setting))) attr)))

(defmacro gruvbox-material-test--with-clean-themes (&rest body)
  "Run BODY, then disable each theme that BODY enabled."
  (declare (indent 0))
  `(let ((enabled custom-enabled-themes))
     (unwind-protect (progn ,@body)
       (dolist (theme custom-enabled-themes)
         (unless (memq theme enabled)
           (disable-theme theme))))))

(ert-deftest gruvbox-material-test-palettes-have-same-colors ()
  "Each palette has the same color names."
  (let ((names (sort (mapcar (lambda (e) (symbol-name (car e)))
                             (gruvbox-material-test--upstream 'dark 'medium))
                     #'string<)))
    (pcase-dolist (`(,_ ,background ,contrast) gruvbox-material-test--themes)
      (should (equal (sort (mapcar (lambda (e) (symbol-name (car e)))
                                   (gruvbox-material-test--upstream background contrast))
                           #'string<)
                     names)))))

(ert-deftest gruvbox-material-test-themes-load ()
  "Each theme loads and sets the background of its palette."
  (gruvbox-material-test--with-clean-themes
    (pcase-dolist (`(,theme ,background ,contrast) gruvbox-material-test--themes)
      (load-theme theme t)
      (should (memq theme custom-enabled-themes))
      (let ((palette (gruvbox-material-test--upstream background contrast)))
        (should (equal (gruvbox-material-test--face-attr theme 'default :background)
                       (alist-get 'bg0 palette)))
        (should (equal (gruvbox-material-test--face-attr theme 'default :foreground)
                       (alist-get 'fg0 palette)))))))

(ert-deftest gruvbox-material-test-unknown-background ()
  "An unknown background signals an error."
  (should-error (gruvbox-material-theme-define 'gruvbox-material-test 'grey 'medium)))

(ert-deftest gruvbox-material-test-terminal-colors ()
  "ANSI black and white change places on a light background."
  (gruvbox-material-test--with-clean-themes
    (load-theme 'gruvbox-material-light-medium t)
    (load-theme 'gruvbox-material-dark-medium t)
    (let ((light (gruvbox-material-test--upstream 'light 'medium))
          (dark (gruvbox-material-test--upstream 'dark 'medium)))
      (should (equal (gruvbox-material-test--face-attr
                      'gruvbox-material-light-medium 'ansi-color-black :foreground)
                     (alist-get 'fg0 light)))
      (should (equal (gruvbox-material-test--face-attr
                      'gruvbox-material-light-medium 'ansi-color-white :foreground)
                     (alist-get 'bg5 light)))
      (should (equal (gruvbox-material-test--face-attr
                      'gruvbox-material-dark-medium 'ansi-color-black :foreground)
                     (alist-get 'bg-statusline1 dark)))
      (should (equal (gruvbox-material-test--face-attr
                      'gruvbox-material-dark-medium 'ansi-color-white :foreground)
                     (alist-get 'fg1 dark))))))

(ert-deftest gruvbox-material-test-saturation-one-is-upstream ()
  "A saturation of 1.0 gives the exact upstream palette."
  (let ((gruvbox-material-saturation 1.0))
    (pcase-dolist (`(,_ ,background ,contrast) gruvbox-material-test--themes)
      (should (equal (gruvbox-material--palette background contrast)
                     (gruvbox-material-test--upstream background contrast))))))

(ert-deftest gruvbox-material-test-saturate-identity ()
  "A factor of 1.0 does not change a color."
  (pcase-dolist (`(,_ ,background ,contrast) gruvbox-material-test--themes)
    (dolist (entry (gruvbox-material-test--upstream background contrast))
      (should (equal (gruvbox-material--saturate (cdr entry) 1.0)
                     (cdr entry))))))

(ert-deftest gruvbox-material-test-saturation-changes-accents-only ()
  "Saturation changes the accent colors and keeps the neutral colors."
  (dolist (background '(dark light))
    (let* ((plain (let ((gruvbox-material-saturation 1.0))
                    (gruvbox-material--palette background 'medium)))
           (strong (let ((gruvbox-material-saturation 1.5))
                     (gruvbox-material--palette background 'medium))))
      (dolist (name '(red green blue))
        (should-not (equal (alist-get name plain) (alist-get name strong))))
      (dolist (name '(bg0 fg0 grey1))
        (should (equal (alist-get name plain) (alist-get name strong)))))))

(defun gruvbox-material-test--keyword-color (theme)
  "Return the foreground of `font-lock-keyword-face' in THEME."
  (gruvbox-material-test--face-attr theme 'font-lock-keyword-face :foreground))

(ert-deftest gruvbox-material-test-setopt-reloads-themes ()
  "Setting the saturation with Customize loads the enabled themes again."
  (let ((old gruvbox-material-saturation)
        (dark-red (alist-get 'red (alist-get 'dark gruvbox-material-foregrounds)))
        (light-red (alist-get 'red (alist-get 'light gruvbox-material-foregrounds))))
    (gruvbox-material-test--with-clean-themes
      (unwind-protect
          (progn
            (customize-set-variable 'gruvbox-material-saturation 1.0)
            (load-theme 'gruvbox-material-light-soft t)
            (load-theme 'gruvbox-material-dark-medium t)
            (should (equal (gruvbox-material-test--keyword-color
                            'gruvbox-material-dark-medium)
                           dark-red))
            (should (equal (gruvbox-material-test--keyword-color
                            'gruvbox-material-light-soft)
                           light-red))
            (customize-set-variable 'gruvbox-material-saturation 1.5)
            (should-not (equal (gruvbox-material-test--keyword-color
                                'gruvbox-material-dark-medium)
                               dark-red))
            (should-not (equal (gruvbox-material-test--keyword-color
                                'gruvbox-material-light-soft)
                               light-red))
            ;; The reload keeps the order of precedence.
            (should (eq (car custom-enabled-themes) 'gruvbox-material-dark-medium)))
        (customize-set-variable 'gruvbox-material-saturation old)))))

(provide 'gruvbox-material-test)

;;; gruvbox-material-test.el ends here
