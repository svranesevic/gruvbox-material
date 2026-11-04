EMACS ?= emacs
FILES := gruvbox-material.el $(wildcard gruvbox-material-*-theme.el)
BATCH := $(EMACS) -Q --batch -L .

.PHONY: all compile checkdoc lint test clean

all: compile checkdoc lint test

compile: clean
	$(BATCH) --eval '(setq byte-compile-error-on-warn t)' \
	  -f batch-byte-compile $(FILES)

checkdoc:
	$(BATCH) --eval '(progn \
	  (require (quote checkdoc)) \
	  (let ((errors 0)) \
	    (advice-add (quote checkdoc-create-error) :before \
	                (lambda (&rest _) (setq errors (1+ errors)))) \
	    (dolist (f command-line-args-left) (checkdoc-file f)) \
	    (kill-emacs (if (> errors 0) 1 0))))' $(FILES)

lint:
	$(BATCH) -l test/lint.el $(FILES)

test:
	$(BATCH) -l test/gruvbox-material-test.el -f ert-run-tests-batch-and-exit

clean:
	rm -f *.elc test/*.elc
