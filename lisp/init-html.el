(require-package 'web-beautify)

(require-package 'tagedit)
(after-load 'sgml-mode
  (define-key html-mode-map (kbd "C-M-\\") 'web-beautify-html)
  (tagedit-add-paredit-like-keybindings)
  (define-key tagedit-mode-map (kbd "M-?") nil)
  (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1))))

(add-auto-mode 'html-mode "\\.\\(jsp\\|tmpl\\)\\'")

;; Note: ERB is configured in init-ruby

(provide 'init-html)
