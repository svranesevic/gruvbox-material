;;; lint.el --- Run package-lint on the package files -*- lexical-binding: t -*-

;; SPDX-License-Identifier: MIT

;;; Commentary:

;; Run with "make lint".  Install package-lint from MELPA into .elpa/,
;; then lint each file given on the command line.  Exit with status 1
;; if package-lint reports an issue that is not in
;; `gruvbox-material-lint-ignore'.

;;; Code:

(require 'package)

(defconst gruvbox-material-lint-ignore
  ;; The face `eldoc-highlight-function-argument' exists.  The function
  ;; with the same name does not, and package-lint reads each face spec
  ;; in the theme as a function call.
  '("`eldoc-highlight-function-argument' was removed")
  "Regexps for package-lint messages to ignore.")

(setq package-user-dir (expand-file-name ".elpa" default-directory))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'package-lint)
  (package-refresh-contents)
  (package-install 'package-lint))
(require 'package-lint)

(let ((package-lint-main-file "gruvbox-material.el")
      (issues 0))
  (dolist (file command-line-args-left)
    (with-temp-buffer
      (insert-file-contents file t)
      (emacs-lisp-mode)
      (pcase-dolist (`(,line ,col ,type ,msg) (package-lint-buffer))
        (unless (seq-some (lambda (re) (string-match-p re msg))
                          gruvbox-material-lint-ignore)
          (setq issues (1+ issues))
          (message "%s:%d:%d: %s: %s" file line col type msg)))))
  (message "package-lint: %d issue(s)" issues)
  (kill-emacs (if (> issues 0) 1 0)))

;;; lint.el ends here
