# gruvbox-material

Dark variants of [Gruvbox Material](https://github.com/sainnhe/gruvbox-material) for Emacs.

The package gives three themes. Each theme has a different background contrast:

| Theme                     | Background |
| ------------------------- | ---------- |
| `gruvbox-material-hard`   | `#1d2021`  |
| `gruvbox-material-medium` | `#282828`  |
| `gruvbox-material-soft`   | `#32302f`  |

All three themes use the "material" foreground palette.

## Requirements

- Emacs 27.1 or later.
- A graphical frame, or a terminal with 256 colors or more.

## Installation

### With `package-vc` (Emacs 29.1 or later)

```elisp
(package-vc-install "https://github.com/svranesevic/gruvbox-material")
(load-theme 'gruvbox-material-medium t)
```

### With `use-package` (Emacs 30.1 or later)

```elisp
(use-package gruvbox-material
  :vc (:url "https://github.com/svranesevic/gruvbox-material"
       :rev :newest)
  :config
  (load-theme 'gruvbox-material-medium t))
```

### Manual installation

1. Clone the repository:

   ```sh
   git clone https://github.com/svranesevic/gruvbox-material.git
   ```

2. Add the directory to `custom-theme-load-path` and load a theme:

   ```elisp
   (add-to-list 'custom-theme-load-path "/path/to/gruvbox-material/")
   (load-theme 'gruvbox-material-medium t)
   ```

You do not have to add the directory to `load-path`.

## Customization

### Saturation

The user option `gruvbox-material-saturation` sets the strength of the
accent colors. The theme multiplies the HSL saturation of each accent color by
this value. The lightness does not change, thus the contrast stays the same.
The backgrounds, the greys and the text colors do not change.

- The default value is `1.2`.
- The value `1.0` gives the exact upstream Gruvbox Material colors.
- A larger value gives stronger colors.

Use `setopt`, `customize-set-variable` or Customize to change the value. The
enabled theme then loads again with the new colors:

```elisp
;; Emacs 29.1 or later
(setopt gruvbox-material-saturation 1.0)

;; All supported Emacs versions
(customize-set-variable 'gruvbox-material-saturation 1.0)
```

A plain `setq` applies only at the next `load-theme`.

## Supported packages

The themes set faces for these built-in features:

- Font lock, including the faces that tree-sitter modes use
- Mode line, header line, tab bar and tab line
- Line numbers, whitespace, parentheses, outline
- Isearch, occur, grep, compilation, xref
- Diff, ediff, smerge, VC
- Flymake, Eglot, Eldoc
- Completions, completion preview
- Dired, ibuffer, Info, Help
- Org, Org Agenda
- Eshell, comint, ANSI colors
- Calendar, Message, Gnus, EWW and shr
- Package menu, Customize and widgets

The themes also set faces for these packages:

avy, cider, company, consult, corfu, diff-hl, diredfl, doom-modeline,
eldoc-box, elfeed, embark, flycheck, flycheck-inline, flycheck-posframe, forge,
git-gutter, git-gutter-fringe, git-timemachine, helpful, hl-todo, hydra, ivy,
lsp-mode, lsp-ui, magit, marginalia, markdown-mode, neotree, notmuch,
orderless, org-roam, paren-face, posframe, pulsar, rainbow-delimiters, slime,
sly, transient, treemacs, treesit-fold, vertico, vertico-posframe, vterm,
which-key, which-key-posframe.

## Development

These commands need Emacs on your `PATH`:

| Command         | Action                                                       |
| --------------- | ------------------------------------------------------------ |
| `make compile`  | Byte-compile the package. A warning causes a failure.        |
| `make checkdoc` | Examine the documentation strings with checkdoc.             |
| `make lint`     | Run package-lint. This command installs it from MELPA first. |
| `make test`     | Run the ERT tests.                                           |
| `make`          | Run all of the above.                                        |

Use `EMACS=/path/to/emacs make` to use a different Emacs.

## Credits

- [Gruvbox Material](https://github.com/sainnhe/gruvbox-material) by sainnhe
  supplies the color palette and the face choices. MIT license.
- [Token](https://github.com/ThorstenRhau/token) by Thorsten Rhau supplies the
  structure of the face list. Its Emacs themes come from work by srg-dev.
  BSD 3-Clause license.

Refer to [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md) for the full license
texts.

## License

MIT. Refer to [LICENSE](LICENSE).
