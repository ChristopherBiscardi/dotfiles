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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-enforce-face ((t (:inherit font-lock-warning-face :underline t :foreground "violet red")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e1ce9c1a191fc8410c62fea27cbd0844e1622e35d749e4c352273dadf1a5a65c" "680839cb8446f3010126d42ca540dead11f3ab454cc786484cd1f26fa3b77e5d" "c0c3705712b93a2ea7c05f48da0132a50e1aec4f4c9e5732f0dda91f483358a5" "8195c272030b78f7b80659c62cae981724c3c73fa9187bcd4cf8e446a118dc9c" "889f68735f33db4a1d8448b445e8fea70ed56bc02fb3e01095236fbda56b3f57" default)))
 '(package-selected-packages
   (quote
    (yaml-mode focus markdown-mode flycheck-gometalinter auto-complete smex yasnippet which-key visual-regexp-steroids use-package undo-tree spaceline-all-the-icons smartparens simpleclip rainbow-mode rainbow-delimiters prettier-js popup paredit org-bullets neotree moe-theme keyfreq helm-core godoctor go-guru go-eldoc flycheck fill-column-indicator direnv company-go column-enforce-mode buffer-move auto-compile ace-window)))
 '(powerline-default-separator (quote slant)))
