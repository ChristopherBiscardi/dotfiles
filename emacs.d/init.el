;;; init.el --- Where all the magic begins
;;
;; This file loads Org-mode and then loads the rest of our Emacs initialization from Emacs lisp
;; embedded in literate Org-mode files.

;; Load up Org Mode and (now included) Org Babel for elisp embedded in Org Mode files

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(let* ((org-dir (expand-file-name
                 "lisp" (expand-file-name
                         "org" (expand-file-name
                                "src" dotfiles-dir))))
       (org-contrib-dir (expand-file-name
                         "lisp" (expand-file-name
                                 "contrib" (expand-file-name
                                            ".." org-dir))))
       (load-path (append (list org-dir org-contrib-dir)
                          (or load-path nil))))
  ;; load up Org-mode and Org-babel
  (require 'org-install)
  (require 'ob-tangle))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8a1838fb11e490480372d3206c0544a47f9d940086d5d841118407c90e011e8a" "75eda3e5280114712ccb579b1cad7489e475c5e581210ac08284bf23ef9b5622" "70dc67bc0ced08fb0e64a721879c0f59f8785ce2019057f16e96054294254121" default)))
 '(package-selected-packages
   (quote
    (helm-ag helm-swoop rust-mode flycheck sass-mode coffee-mode tide typescript-mode mode-icons all-the-icons yaml-mode web-mode web-beautify visual-regexp-steroids undo-tree syslog-mode smex simpleclip shm rich-minority rainbow-mode rainbow-delimiters purescript-mode projectile powerline paredit org-bullets notify neotree multiple-cursors minimap markdown-mode magit less-css-mode kooten-theme keyfreq intero idris-mode ido-vertical-mode ido-ubiquitous hindent haskell-snippets go-mode git-rebase-mode git-commit-mode gist full-ack flycheck-haskell flx-ido elm-mode ein dracula-theme company-restclient company-ghc company-cabal cmm-mode ace-window)))
 '(powerline-default-separator (quote slant)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; load up all literate org-mode files in this directory
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))

;;; init.el ends here
(defun doremi-face-set (face spec)
      "Tell Customize that FACE has been set to value SPEC.
  SPEC is as for `defface'."
  (put face 'customized-face spec)
  (face-spec-set face spec)
  (message (substitute-command-keys
            "Use `\\[customize-customized]' to revisit changes.")))

;;(doremi-face-set org-hide ())
