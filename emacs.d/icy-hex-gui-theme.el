(deftheme icy-hex-gui
  "Created 2016-02-25.")

(custom-theme-set-faces
 'icy-hex-gui
 '(default ((t (:family "Meslo LG L DZ for Powerline" :foundry "default" :width normal :height 1 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "white" :background "#002833" :stipple nil :inherit nil))))
 '(cursor ((((background light)) (:background "#003541")) (((background dark)) (:background "white"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((((background dark)) (:foreground "#00beae")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:foreground "#abccce"))))
 '(highlight ((t (:background "#258bd2"))))
 '(web-mode-html-tag-face ((t (:foreground "#00779a"))))
 '(region ((((class color) (min-colors 88) (background dark)) (:background "#258bd2"))
           (((class color) (min-colors 8)) (:foreground "white" :background "#258bd2")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) 
           (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) 
           (((class color) (min-colors 8) (background light)) (:foreground "green")) 
           (((class color) (min-colors 8) (background dark)) (:foreground "#c09035"))))
 '(secondary-selection ((((class color) (min-colors 88) (background light)) (:background "#00beae")) 
                        (((class color) (min-colors 88) (background dark)) (:background "#00beae")) 
                        (((class color) (min-colors 16) (background light)) (:background "#00beae")) 
                        (((class color) (min-colors 16) (background dark)) (:background "#00beae")) 
                        (((class color) (min-colors 8)) (:foreground "#003541" :background "#00beae")) (t (:inverse-video t))))
 '(trailing-whitespace ((((class color) (background light)) (:background "red1")) 
                        (((class color) (background dark)) (:background "red1")) (t (:inverse-video t))))
 '(font-lock-builtin-face ((((class grayscale) (background light)) (:weight bold :foreground "LightGray")) 
                           (((class grayscale) (background dark)) (:weight bold :foreground "DimGray")) 
                           (((class color) (min-colors 88) (background light)) (:foreground "#00779a")) 
                           (((class color) (min-colors 88) (background dark)) (:foreground "#00779a")) 
                           (((class color) (min-colors 16) (background light)) (:foreground "#00779a")) 
                           (((class color) (min-colors 16) (background dark)) (:foreground "#00779a")) 
                           (((class color) (min-colors 8)) (:weight bold :foreground "#00779a")) (t (:weight bold))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((((class grayscale) (background light)) (:slant italic :weight bold :foreground "DimGray"))
			   (((class grayscale) (background dark)) (:slant italic :weight bold :foreground "LightGray"))
			   (((class color) (min-colors 88) (background light)) (:foreground "#004a5b"))
			   (((class color) (min-colors 88) (background dark)) (:foreground "#004a5b"))
			   (((class color) (min-colors 16) (background light)) (:foreground "#004a5b"))
			   (((class color) (min-colors 16) (background dark)) (:foreground "#004a5b"))
			   (((class color) (min-colors 8) (background light)) (:foreground "#004a5b"))
			   (((class color) (min-colors 8) (background dark)) (:foreground "#004a5b")) (t (:slant italic :weight bold))))
 '(font-lock-constant-face ((((class grayscale) (background light)) (:underline (:color foreground-color :style line) :weight bold :foreground "LightGray")) 
                            (((class grayscale) (background dark)) (:underline (:color foreground-color :style line) :weight bold :foreground "Gray50")) 
                            (((class color) (min-colors 88) (background light)) (:foreground "#ea68a0")) 
                            (((class color) (min-colors 88) (background dark)) (:foreground "#ea68a0")) 
                            (((class color) (min-colors 16) (background light)) (:foreground "#ea68a0")) 
                            (((class color) (min-colors 16) (background dark)) (:foreground "#ea68a0")) 
                            (((class color) (min-colors 8)) (:foreground "#ea68a0")) (t (:underline (:color foreground-color :style line) :weight bold))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 '(font-lock-function-name-face ((t (:foreground "#abccce"))))
 '(font-lock-keyword-face ((((class grayscale) (background light)) (:weight bold :foreground "LightGray")) 
                           (((class grayscale) (background dark)) (:weight bold :foreground "DimGray")) 
                           (((class color) (min-colors 88) (background light)) (:foreground "#00beae")) 
                           (((class color) (min-colors 88) (background dark)) (:foreground "#00beae")) 
                           (((class color) (min-colors 16) (background light)) (:foreground "#00beae")) 
                           (((class color) (min-colors 16) (background dark)) (:foreground "#00beae")) 
                           (((class color) (min-colors 8)) (:weight bold :foreground "#00beae")) (t (:weight bold))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((((class grayscale) (background light)) (:slant italic :foreground "#5cee96"))
			  (((class grayscale) (background dark)) (:slant italic :foreground "#5cee96"))
			  (((class color) (min-colors 88) (background light)) (:foreground "#5cee96"))
			  (((class color) (min-colors 88) (background dark)) (:foreground "#5cee96"))
			  (((class color) (min-colors 16) (background light)) (:foreground "#5cee96"))
			  (((class color) (min-colors 16) (background dark)) (:foreground "#5cee96"))
			  (((class color) (min-colors 8)) (:foreground "#5cee96")) (t (:slant italic))))
 '(font-lock-type-face ((((class grayscale) (background light)) (:weight bold :foreground "Gray90")) 
                        (((class grayscale) (background dark)) (:weight bold :foreground "DimGray")) 
                        (((class color) (min-colors 88) (background light)) (:foreground "#5cee96")) 
                        (((class color) (min-colors 88) (background dark)) (:foreground "#5cee96")) 
                        (((class color) (min-colors 16) (background light)) (:foreground "#5cee96")) 
                        (((class color) (min-colors 16) (background dark)) (:foreground "#5cee96")) 
                        (((class color) (min-colors 8)) (:foreground "#5cee96")) (t (:underline (:color foreground-color :style line) :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#00779a"))))
 '(font-lock-warning-face ((t (:inherit (error)))))
 '(button ((t (:inherit (link)))))
 '(link ((t (:underline (:color foreground-color :style line) :foreground "SkyBlue1"))))
 '(link-visited ((t (:foreground "magenta4" :inherit (link)))))
 '(fringe ((t (:inherit (default)))))
 '(header-line ((t (:underline (:color foreground-color :style line) :inverse-video nil :inherit (mode-line)))))
 '(tooltip ((t (:foreground "#003541" :background "lightyellow" :inherit (variable-pitch)))))
 '(mode-line ((t (:background "#002028" :foreground "#258bd2" :box nil))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box nil)) (t (:inherit (highlight)))))
 '(mode-line-inactive ((t (:weight light :box nil :foreground "#258bd2" :background "#002028" :inherit (mode-line)))))
 '(isearch ((((class color) (min-colors 88) (background light)) (:foreground "lightskyblue1" :background "magenta3")) 
            (((class color) (min-colors 88) (background dark)) (:foreground "brown4" :background "palevioletred2")) 
            (((class color) (min-colors 16)) (:foreground "cyan1" :background "magenta4")) 
            (((class color) (min-colors 8)) (:foreground "cyan1" :background "magenta4")) (t (:inverse-video t))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "#f9324b")) 
                 (((class color) (min-colors 88) (background dark)) (:background "#f9324b")) 
                 (((class color) (min-colors 16)) (:background "#f9324b")) 
                 (((class color) (min-colors 8)) (:background "#f9324b")) 
                 (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 '(lazy-highlight ((((class color) (min-colors 88) (background light)) (:background "paleturquoise")) 
                   (((class color) (min-colors 88) (background dark)) (:background "paleturquoise4")) 
                   (((class color) (min-colors 16)) (:background "turquoise3")) 
                   (((class color) (min-colors 8)) (:background "turquoise3")) (t (:underline (:color foreground-color :style line)))))
 '(match ((((class color) (min-colors 88) (background light)) (:background "#c09035")) 
          (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) 
          (((class color) (min-colors 8) (background light)) (:foreground "#003541" :background "#c09035")) 
          (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "#00779a")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch)))))
 '(powerline-active1 ((t (:background "#00485b" :foreground "#258bd2"))))
 '(powerline-active2 ((t (:background "#002028" :foreground "#258bd2"))))
 '(powerline-inactive1 ((t (:background "#00485b" :foreground "#00485b"))))
 '(powerline-inactive2 ((t (:background "#003441" :foreground "#003441"))))

 '(org-hide ((t (:background "#002833" :foreground "#002833")))))

(custom-theme-set-variables
 'icy-hex-gui
 '(powerline-default-separator 'slant))

(provide-theme 'icy-hex-gui)
