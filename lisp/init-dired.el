;;; init-dired.el --- Dired customisations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default dired-dwim-target t)

;; Prefer g-prefixed coreutils version of standard utilities when available
(let ((gls (executable-find "gls")))
  (when gls (setq insert-directory-program gls)))

(when (maybe-require-package 'diredfl)
  (after-load 'dired
    (diredfl-global-mode)
    (require 'dired-x)))

;; Hook up dired-x global bindings without loading it up-front
(define-key ctl-x-map "\C-j" 'dired-jump)
(define-key ctl-x-4-map "\C-j" 'dired-jump-other-window)

(after-load 'dired
  (setq dired-recursive-deletes 'top)
  (define-key dired-mode-map [mouse-2] 'dired-find-file)
  (define-key dired-mode-map (kbd "C-c C-q") 'wdired-change-to-wdired-mode))

(when (maybe-require-package 'diff-hl)
  (after-load 'dired
    (add-hook 'dired-mode-hook 'diff-hl-dired-mode)))

(defun goto-recent-directory ()
  "Recent directories"
  (interactive)
  (let (collection)
    (unless recentf-mode (recentf-mode 1))
    (setq collection
          (append (remove-duplicates
                   (mapcar 'file-name-directory recentf-list)
                   :test (lambda (x y) (or (null y) (equal x y)))
                   :from-end t)
                  ;; fasd history
                  (if (executable-find "fasd")
                      (mapcar (lambda (v) (replace-regexp-in-string "^[.0-9]+ +" "" v))
                              (split-string (shell-command-to-string "fasd -d") "\n" t)))))
    (ivy-read "directories:" collection :action 'dired)))




(provide 'init-dired)
;;; init-dired.el ends here
