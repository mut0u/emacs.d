(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(sanityinc-tomorrow-bright))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-day))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-bright))
  (reapply-themes))


(when (maybe-require-package 'dimmer)
  (setq-default dimmer-fraction 0.15)
  (add-hook 'after-init-hook 'dimmer-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-paren-colors (quote ("Cyan" "Gold" "Red")))
 '(imaxima-bg-color "black")
 '(imaxima-equation-color "Green3")
 '(imaxima-fg-color "DarkGreen")
 '(imaxima-fnt-size "Large")
 '(imaxima-label-color "slategrey")
 '(imaxima-max-scale 0.85)
 '(imaxima-pt-size 12)
 '(smiley-style (quote medium))
 '(tabbar-background-color "black")
 '(tramp-verbose 0))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(speedbar-file-face ((((class color)  ) (:foreground "SeaGreen2"))))
 '(speedbar-highlight-face ((((class color)  ) (:background "LightGoldenrod" :foreground "black"))))
 '(speedbar-selected-face ((((class color)  ) (:foreground "Cyan" :underline t))))
 '(speedbar-separator-face ((((class color) ) (:background "DarkRed" :foreground "white" :overline "gray"))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "red" :box (:line-width 1 :color "black" :style released-button)))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default  :foreground "green" :box (:color "red")))))
 '(tabbar-default ((((class color grayscale)) (:inherit variable-pitch :height 1.3))))
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "green2" :box (:line-width 1 :color "#10650F")))))
 '(tabbar-selected-face ((t (:inherit tabbar-default-face :foreground "grey" :box (:line-width -1 :color "grey" :style released-button)))))
 '(tabbar-separator ((t (:inherit tabbar-default :foreground "brown" :height 0.1))))
 '(tabbar-unselected ((t (:inherit tabbar-default  :foreground "#10650F" :box (:line-width 1 :color "#10650F")))))
 '(tabbar-unselected-face ((t (:inherit tabbar-default-face :foreground "white" :box (:line-width -1 :color "black" :style pressed-button)))))

 )


(provide 'init-themes)
