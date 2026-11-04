;;; gruvbox-material-test.el --- Tests for gruvbox-material -*- lexical-binding: t -*-

;; SPDX-License-Identifier: MIT

;;; Commentary:

;; Run with "make test".

;;; Code:

(require 'ert)
(require 'seq)
(require 'gruvbox-material)

(defconst gruvbox-material-test--themes
  '((gruvbox-material-hard   . hard)
    (gruvbox-material-medium . medium)
    (gruvbox-material-soft   . soft))
  "Each theme and its contrast.")

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

(ert-deftest gruvbox-material-test-themes-load ()
  "Each theme loads and sets the background of its contrast."
  (gruvbox-material-test--with-clean-themes
    (pcase-dolist (`(,theme . ,contrast) gruvbox-material-test--themes)
      (load-theme theme t)
      (should (memq theme custom-enabled-themes))
      (should (equal (gruvbox-material-test--face-attr theme 'default :background)
                     (alist-get 'bg0 (alist-get contrast gruvbox-material-backgrounds)))))))

(ert-deftest gruvbox-material-test-saturation-one-is-upstream ()
  "A saturation of 1.0 gives the exact upstream palette."
  (let ((gruvbox-material-saturation 1.0))
    (dolist (contrast '(hard medium soft))
      (should (equal (gruvbox-material--palette contrast)
                     (append (alist-get contrast gruvbox-material-backgrounds)
                             gruvbox-material-foreground
                             gruvbox-material-grey))))))

(ert-deftest gruvbox-material-test-saturate-identity ()
  "A factor of 1.0 does not change a color."
  (dolist (entry (append gruvbox-material-foreground
                         gruvbox-material-grey
                         (alist-get 'hard gruvbox-material-backgrounds)))
    (should (equal (gruvbox-material--saturate (cdr entry) 1.0)
                   (cdr entry)))))

(ert-deftest gruvbox-material-test-saturation-changes-accents-only ()
  "Saturation changes the accent colors and keeps the neutral colors."
  (let* ((plain (let ((gruvbox-material-saturation 1.0))
                  (gruvbox-material--palette 'medium)))
         (strong (let ((gruvbox-material-saturation 1.5))
                   (gruvbox-material--palette 'medium))))
    (dolist (name '(red green blue))
      (should-not (equal (alist-get name plain) (alist-get name strong))))
    (dolist (name '(bg0 fg0 grey1))
      (should (equal (alist-get name plain) (alist-get name strong))))))

(ert-deftest gruvbox-material-test-setopt-reloads-theme ()
  "Setting the saturation with Customize loads the enabled theme again."
  (let ((old gruvbox-material-saturation))
    (gruvbox-material-test--with-clean-themes
      (unwind-protect
          (progn
            (customize-set-variable 'gruvbox-material-saturation 1.0)
            (load-theme 'gruvbox-material-medium t)
            (should (equal (gruvbox-material-test--face-attr
                            'gruvbox-material-medium 'font-lock-keyword-face :foreground)
                           (alist-get 'red gruvbox-material-foreground)))
            (customize-set-variable 'gruvbox-material-saturation 1.5)
            (should-not (equal (gruvbox-material-test--face-attr
                                'gruvbox-material-medium 'font-lock-keyword-face :foreground)
                               (alist-get 'red gruvbox-material-foreground))))
        (customize-set-variable 'gruvbox-material-saturation old)))))

(provide 'gruvbox-material-test)

;;; gruvbox-material-test.el ends here
