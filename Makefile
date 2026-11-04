EMACS ?= emacs
FILES := gruvbox-material.el $(wildcard gruvbox-material-*-theme.el)
BATCH := $(EMACS) -Q --batch -L .

.PHONY: all compile checkdoc lint test clean

all: compile checkdoc lint test

compile: clean
	$(BATCH) --eval '(setq byte-compile-error-on-warn t)' \
	  -f batch-byte-compile $(FILES)

checkdoc:
	$(BATCH) -l test/checkdoc.el $(FILES)

lint:
	$(BATCH) -l test/lint.el $(FILES)

test:
	$(BATCH) -l test/gruvbox-material-test.el -f ert-run-tests-batch-and-exit

clean:
	rm -f *.elc test/*.elc
