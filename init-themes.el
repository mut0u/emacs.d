;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(require-package 'color-theme-library)
;(color-theme-arjen)

(require 'color-theme)

(defun color-theme-monokai ()
  "Monokai color theme for Emacs by Operator.
Based on the TextMate theme Monokai"
  (interactive)
  (color-theme-install
   '(color-theme-monokai
     ((foreground-color . "#F8F8F2")
      (background-color . "#272822")
      (background-mode . dark)
      (cursor-color . "#73d216") ; medium chameleon
      (mouse-color . "#73d216"))

     ;;; Standard font lock faces
     (default ((t (nil))))
     (font-lock-comment-face ((t (:foreground "#75715E")))) ; dark aluminum
     (font-lock-comment-delimiter-face ((t (:foreground "#75715E")))) ; dark aluminum
     (font-lock-doc-face ((t (:foreground "#75715E")))) ; plum
     (font-lock-doc-string-face ((t (:foreground "#75715E")))) ; plum
     (font-lock-string-face ((t (:foreground "#E6DB74")))) ; plum
     (font-lock-keyword-face ((t (:foreground "#F92672")))) ; light sky blue
     (font-lock-builtin-face ((t (:foreground "#855c1b")))) ; med-dark chocolate
     (font-lock-function-name-face ((t (:foreground "#A6E22E")))) ; dark butter
     (font-lock-variable-name-face ((t (:foreground "#FD971F"))))
     (font-lock-preprocessor-face ((t (:foreground "#66D9EF")))) ; aluminum
     (font-lock-constant-face ((t (:foreground "#4e9a06")))) ; dark chameleon
     (font-lock-type-face ((t (:foreground "#66D9EF")))) ; light plum
     (font-lock-warning-face ((t (:bold t :foreground "#cc0000")))) ; scarlet red

     ;; Search
     (isearch ((t (:foreground "#080808" :background "#edd400"))))
     (isearch-lazy-highlight-face ((t (:foreground "#080808" :background "#75715E"))))

     ;; Emacs Interface
     (fringe ((t (:background "#0f0f0f"))))
     (border ((t (:background "#0f0f0f"))))
     (mode-line ((t (:background "#1f1f1f" :foreground "#eeeeec"))))
     (mode-line-buffer-id ((t (:background "#1f1f1f" :foreground "#eeeeec"))))
     (mode-line-inactive ((t (:background "#1f1f1f" :foreground "#888a85"))))
     (minibuffer-prompt ((t (:foreground "#729fcf")))) ; light sky blue
     (region ((t (:background "#49483E"))))

     ;; Parenthesis matching
     (show-paren-match-face ((t (:foreground "#2e3436" :background "#3E3D32"))))
     (show-paren-mismatch-face ((t (:foreground "#2e3436" :background "#ef2929"))))

     ;; Calendar
     (holiday-face ((t (:foreground "#cc0000")))) ; dark scarlet red

     ;; Info
     (info-xref ((t (:foreground "#729fcf")))) ; light sky blue
     (info-xref-visited ((t (:foreground "#ad7fa8")))) ; light plum

     ;;; AUCTeX
     (font-latex-sectioning-5-face ((t (:foreground "#c4a000" :bold t)))) ; dark butter
     (font-latex-bold-face ((t (:foreground "#4e9a06" :bold t)))) ; dark chameleon
     (font-latex-italic-face ((t (:foreground "#4e9a06" :italic t)))) ; dark chameleon
     (font-latex-math-face ((t (:foreground "#855c1b")))) ; med-dark chocolate
     (font-latex-string-face ((t (:foreground "#77507b")))) ; plum
     (font-latex-warning-face ((t (:foreground "#cc0000")))) ; dark scarlet red
     (font-latex-slide-title-face ((t (:foreground "#c4a000")))) ; dark butter
     )))

(color-theme-monokai)
















(provide 'init-themes)