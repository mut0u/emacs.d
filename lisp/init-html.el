;;; init-html.el --- Editing HTML -*- lexical-binding: t -*-
;;; Commentary:

;; ERB is configured separately in init-ruby

;;; Code:

(require-package 'web-beautify)

(require-package 'tagedit)
(after-load 'sgml-mode
  (define-key html-mode-map (kbd "C-M-\\") 'web-beautify-html)
  (tagedit-add-paredit-like-keybindings)
  (define-key tagedit-mode-map (kbd "M-?") nil)
  (define-key tagedit-mode-map (kbd "M-s") nil)
  (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1))))

(add-auto-mode 'html-mode "\\.\\(jsp\\|tmpl\\)\\'")


(provide 'init-html)
;;; init-html.el ends here
