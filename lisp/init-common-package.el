(require-package 'groovy-mode)
(require-package 'gradle-mode)
(require-package 'protobuf-mode)
(require-package 'yaml-mode)
(require-package 'tidy)
(require-package 'thrift)
(require-package 'projectile)
(require-package 'popwin)
(require-package 'ac-octave)


(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))




(defun my-octave-mode-config ()
  (local-set-key (kbd "C-c C-c") 'octave-send-region)                ; add a key
  ;; more here
  )


(add-hook 'octave-mode-hook 'my-octave-mode-config)

(provide 'init-common-package)

;;; init-common-package.el ends here
