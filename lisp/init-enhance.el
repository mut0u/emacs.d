;;;
(global-disable-mouse-mode)


(require 'thing-edit)
;;(require 'aweshell)
(require 'awesome-tab)
(awesome-tab-mode t)


(require 'youdao-dictionary)
(global-set-key (kbd "<f8>") 'youdao-dictionary-search-at-point+)

(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
          'append)

(require 'awesome-tray)
(awesome-tray-mode t)


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


(provide 'init-enhance)
;;; init-enhance.el ends here
