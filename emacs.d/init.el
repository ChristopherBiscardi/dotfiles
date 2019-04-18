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
    ("7b5936b09f3f66b68c3ad24b3f09d3a739b69e6775e200785163d5380e8f97f2" "b29aff03df95c5e1a1c1401a73d16791ed9ffc5164881b91b5428f408c022c77" "49ca912216ad67a655734c7995a5be4dfd8877c48790bfbed4b42df3584d9eb8" "71e258a4ba6f4da9da9a10886ba6c7fa869ef113aa26d77e9f45c5f55431bb8b" "34efc72565c0c11393e0b7161a17e1d3889d31767d3eca96620a2f5a0d15628c" "ebd91121713c90f9308ea1676cee5f0e39b9537cc4b823521493b985939dc4ed" "a00be48840ec42705062bcf5d85d1e07dbe978acc65081c9c1d1919f78905e8e" "f450ec894732f7822516b25435f8fa706520211d00ca6ee8d4c70be143bc5aad" "2d64c7fb56b0f8e40df12691384431b4afc0a3db982782177716d71bea2c21d1" "e1ce9c1a191fc8410c62fea27cbd0844e1622e35d749e4c352273dadf1a5a65c" "680839cb8446f3010126d42ca540dead11f3ab454cc786484cd1f26fa3b77e5d" "c0c3705712b93a2ea7c05f48da0132a50e1aec4f4c9e5732f0dda91f483358a5" "8195c272030b78f7b80659c62cae981724c3c73fa9187bcd4cf8e446a118dc9c" "889f68735f33db4a1d8448b445e8fea70ed56bc02fb3e01095236fbda56b3f57" default)))
 '(package-selected-packages
   (quote
    (k8s-mode flycheck-pony pony-snippets ponylang-mode web-mode ivy swiper counsel typescript-mode graphviz-dot-mode abbrev-mode abbrev command-log-mode multiple-cursors org-fstree ob-translate go-playground edit-indirect yaml-mode focus markdown-mode flycheck-gometalinter auto-complete smex yasnippet which-key visual-regexp-steroids use-package undo-tree spaceline-all-the-icons smartparens simpleclip rainbow-mode rainbow-delimiters prettier-js popup paredit org-bullets neotree moe-theme keyfreq helm-core godoctor go-guru go-eldoc flycheck fill-column-indicator direnv company-go column-enforce-mode buffer-move auto-compile ace-window)))
 '(powerline-default-separator (quote slant))
 '(safe-local-variable-values (quote ((web-indent-offset . 4)))))
