;;

(require-package 'golint)
(require-package 'go-mode )
(require-package 'go-dlv)
(require-package 'go-errcheck)
(require-package 'go-playground)
(require-package 'company-go )
(require-package 'go-eldoc)
(require-package 'go-add-tags)
(require-package 'go-gopath)


(require-package 'go-projectile )
(require-package 'gotest)

;; Ignore go test -c output files
(add-to-list 'completion-ignored-extensions ".test")

;;(define-key 'help-command (kbd "G") 'godoc)

;;;; this is just hack the go test function, because it has not update the package recently.
;;;###autoload
(defun go-test-current-test-verbose ()
  "Launch go test on the current test."
  (interactive)
  (require 'gotest)
  (add-hook 'go-test-mode-hook #'toggle-truncate-lines)
  (cl-destructuring-bind (test-suite test-name) (go-test--get-current-test-info)
    (let ((test-flag (if (> (length test-suite) 0) "-m " "-run "))
          (additional-arguments (if go-test-additional-arguments-function
                                    (funcall go-test-additional-arguments-function
                                             test-suite test-name) "")))
      (when test-name
        (if (go-test--is-gb-project)
            (go-test--gb-start (s-concat "-count=1 -test.v=true -test.run=" test-name "\\$ ."))
          (go-test--go-test (s-concat test-flag test-name additional-arguments "\\$ -v -count=1 .")))))))



(defun go-test-generate-code()
  (interactive)
  (let ((buf (get-buffer-create "*Gotests patch*"))
        (coding-system-for-read 'utf-8)
        (coding-system-for-write 'utf-8))

    (with-current-buffer buf
      (erase-buffer))

    ;; Only run when buffer is test file
    (if (string-match-p "_test\\.go\\'" (buffer-file-name))
        (progn
          (call-process "gotests" nil buf nil "-w" "-r" (buffer-file-name))
          (revert-buffer :ignore-auto :noconfirm)))))

(after-load 'go-mode
  ;;(require 'go-oracle)
  ;;(add-hook 'go-mode-hook 'go-oracle-mode)
  (add-hook 'go-mode-hook (lambda () (setq tab-width 2)))
  (add-hook 'go-mode-hook 'hs-minor-mode)
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'gofmt-before-save nil t)))
  (let ((map go-mode-map))
    (define-key map (kbd "C-c C-r")'go-remove-unused-imports)
    (define-key map (kbd "C-c C-f") 'gofmt)
    (define-key map (kbd "C-c a") 'go-test-current-project) ;; current package, really
    (define-key map (kbd "C-c m") 'go-test-current-file)
    (define-key map (kbd "C-c .") 'go-test-current-test-verbose)
    (define-key map (kbd "C-c c") 'compile)
    (define-key go-mode-map (kbd "C-c C-e") #'go-gopath-set-gopath)
    (define-key map (kbd "M-.") 'godef-jump)
    (define-key map (kbd "C-u M-.")  'godef-jump-other-window)
    (define-key map (kbd "C-c C-c" ) 'comment-region)
    (define-key map (kbd "C-u C-c C-c") 'uncomment-region)
    (define-key map (kbd "C-<f1>") 'go-errcheck)
    (define-key map (kbd "<f2>") 'go-playground)
    (define-key map (kbd "<f3>") 'go-playground-exec)
    (define-key map (kbd "C-c b") 'go-run)
    (define-key map (kbd "C-h f") 'godoc-at-point))

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


(defun dlv-set-break-point ()
  "set breakpoint using dlv"
  (interactive)
  (when (get-buffer "*gud-test*")
    (let ((current-func-loc (format "%s:%d" buffer-file-name (line-number-at-pos)))
          (cbuffer (current-buffer)))
      (save-excursion
        (switch-to-buffer "*gud-test*")
        (gud-call (format "break %s" current-func-loc))
        (switch-to-buffer cbuffer)))))






(provide 'init-go)
