(require-package 'jedi)
;;;(require-package 'pretty-lambdada)
(require 'pymacs)

(defun load-ropemacs ()
  "Load pymacs and ropemacs"
  (interactive)
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")
  ;; Automatically save project python buffers before refactorings
  (setq ropemacs-confirm-saving 'nil))


(define-coding-system-alias 'utf8 'utf-8)
(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))


(defun python-add-breakpoint ()
  "Add a break point"
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent)
  (insert "import ipdb; ipdb.set_trace()")
  (highlight-lines-matching-regexp "^[ ]*import ipdb; ipdb.set_trace()"))



(defun python-interactive ()
  "Enter the interactive Python environment"
  (interactive)
  (move-end-of-line 1)
  (progn
    (insert "!import code; code.interact(local=vars())")
    (move-end-of-line 1)
    (comint-send-input)))




(defun python-add-log-print ()
  (interactive)
  (newline-and-indent)
  (insert "print '∑' * 80")
  (highlight-lines-matching-regexp
   "^[ ]*print '∑" * 80))


;;;(setq python-check-command "pycheckers")

;;;;;(add-hook 'python-mode-hook
;;;;;          '(lambda ()
;;;;;             (jedi:setup)
;;;;;             (hs-minor-mode t)
;;;;;             ;(lambda-mode 1)
;;;;;             ))
;;;;;
;;;;;(setq jedi:setup-keys t)
;;;;;(setq jedi:complete-on-dot t)







;;(add-hook 'python-mode-hook
;;   #'(lambda ()
;;       (define-key python-mode-map (kbd "C-c C-b") 'python-add-breakpoint)
;;))

;; Configure flymake for Python
                                        ;(setq pylint "pylint")
                                        ;(setf pylint-options "--load-plugins pylint_django")
(when (load "flymake" t)
                                        ;(autoload 'pylint "pylint")
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "epylint" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))


;;;(add-hook 'python-mode-hook 'pylint-add-key-bindings)
;;;(require-package 'flycheck-pyflakes)
;;;(add-hook 'python-mode-hook 'flycheck-mode)

;;;(eval-after-load 'flycheck
;;;  (add-to-list 'flycheck-disabled-checkers 'python-pylint))

(after-load 'python-mode
  (pymacs-load "ropemacs" "rope-")
  (setf  python-check-command "epylint")
  (global-set-key "\C-xpl" 'load-ropemacs)
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  (add-hook 'python-mode-hook 'pylint-add-menu-items)
  (add-hook 'python-mode-hook '(lambda () (flymake-mode))))

(provide 'init-python)
