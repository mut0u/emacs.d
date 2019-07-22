;;;
(setq default-major-mode 'text-mode)    ;设置默认地主模式为TEXT模式
(global-disable-mouse-mode)

;;;(require 'lazycat-theme)
(custom-set-faces  '(header-line ((t (:background "Black" :foreground "Green")))))

(require 'awesome-tray)
(awesome-tray-mode 1)

(require 'thing-edit)
(require 'aweshell)
(require 'snails)
(require 'awesome-tab)
(require-package 'all-the-icons)
(awesome-tab-mode t)
(setq awesome-tab-style "bar")

(require 'youdao-dictionary)
(global-set-key (kbd "<f8>") 'youdao-dictionary-search-at-point+)

(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
          'append)

(defun michael-enhance ()
  "I am not sure the tray mode why ..."
  (interactive)
  (awesome-tray-mode t)
  )


(defun eldoc-trigger ()
  (interactive)
  (if global-eldoc-mode
      (progn (global-eldoc-mode -1)
             (remove-hook 'pre-command-hook 'eldoc-pre-command-refresh-echo-area))
    (global-eldoc-mode t)))

(defun eldoc-disable-local ()
  (interactive)
  (setq-local eldoc-documentation-function #'ignore))

(maybe-require-package 'undo-tree)


(provide 'init-enhance)
;;; init-enhance.el ends here
