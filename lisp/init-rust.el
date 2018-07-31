(when (maybe-require-package 'rust-mode)
  (when (maybe-require-package 'racer)
    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode))
  (when (maybe-require-package 'company)
    (add-hook 'racer-mode-hook #'company-mode)))

(when (maybe-require-package 'flycheck-rust)
  (after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(maybe-require-package 'rust-playground)
;;(maybe-require-package 'lsp-mode)
;;
;;
;;(defun my-set-projectile-root ()
;;  (when lsp--cur-workspace
;;    (setq projectile-project-root (lsp--workspace-root lsp--cur-workspace))))
;;
;;
;;
;;
;;(with-eval-after-load 'lsp-mode
;;  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
;;  (require 'lsp-rust)
;;  (add-hook 'rust-mode-hook #'lsp-rust-enable)
;;  (add-hook 'rust-mode-hook #'flycheck-mode)
;;  (add-hook 'lsp-before-open-hook #'my-set-projectile-root)
;;  )
;;
;;



(provide 'init-rust)
