;;

(require-package 'golint)
(require-package 'go-mode )
(require-package 'company-go )
(require-package 'go-eldoc)
(require-package 'go-projectile )
(require-package 'gotest)

;; Ignore go test -c output files
(add-to-list 'completion-ignored-extensions ".test")

;;(define-key 'help-command (kbd "G") 'godoc)




(after-load 'go-mode
  ;;(require 'go-oracle)
  ;;(add-hook 'go-mode-hook 'go-oracle-mode)

  (add-hook 'go-mode-hook (lambda () (setq tab-width 2)))
  (let ((map go-mode-map))
    (define-key map (kbd "C-c C-r")'go-remove-unused-imports)
    (define-key map (kbd "C-c C-f") 'gofmt)
    (define-key map (kbd "C-c a") 'go-test-current-project) ;; current package, really
    (define-key map (kbd "C-c m") 'go-test-current-file)
    (define-key map (kbd "C-c .") 'go-test-current-test)
    (define-key map (kbd "C-c c") 'compile)
    (define-key map (kbd "M-.") 'godef-jump)
    (define-key map (kbd "C-c C-c" ) 'comment-region)
    (define-key map (kbd "C-u C-c C-c") 'uncomment-region)
    (define-key map (kbd "C-c b") 'go-run)
    (define-key map (kbd "C-h f") 'godoc-at-point))
  (add-hook 'before-save-hook 'gofmt-before-save nil t)
  (setq compile-command "go test -v")

  ;; stop whitespace being highlighted
  (whitespace-toggle-options '(tabs))
  ;; Company mode settings
  (set (make-local-variable 'company-backends) '(company-go))

  ;; El-doc for Go
  (go-eldoc-setup)
  ;; CamelCase aware editing operations
  (subword-mode +1)
  )

(provide 'init-go)
