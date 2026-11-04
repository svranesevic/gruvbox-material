;;; checkdoc.el --- Run checkdoc on the package files -*- lexical-binding: t -*-

;; SPDX-License-Identifier: MIT

;;; Commentary:

;; Run with "make checkdoc".  Examine each file given on the command
;; line.  Exit with status 1 if checkdoc reports an issue.

;;; Code:

(require 'checkdoc)

(let ((issues 0))
  (advice-add 'checkdoc-create-error :before
              (lambda (&rest _) (setq issues (1+ issues))))
  (dolist (file command-line-args-left)
    (checkdoc-file file))
  (message "checkdoc: %d issue(s)" issues)
  (kill-emacs (if (> issues 0) 1 0)))

;;; checkdoc.el ends here
