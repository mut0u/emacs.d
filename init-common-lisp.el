
(show-paren-mode t)

(setq inferior-lisp-program "/usr/bin/sbcl") ;sbcl的路径  
(add-to-list 'load-path "~/.emacs.d/slime") ;slime的路径  ;;下载最新的slime 出了问题，暂时不知道怎么解决。  
;;(add-to-list 'load-path "~/.emacs/slime")
(require-package 'ac-slime)
(require-package 'hippie-expand-slime)




(require 'slime)  


(slime-setup '(slime-fancy))
(slime-setup '(slime-repl slime-scratch slime-editing-commands))


(slime) ;M-x slime



;; See http://bc.tech.coop/blog/070927.html
(add-auto-mode 'lisp-mode "\\.cl\\'")
(add-hook 'lisp-mode-hook (lambda ()
                            (cond ((not (featurep 'slime))
                                   (require 'slime)
                                   (normal-mode)))))



;; From http://bc.tech.coop/blog/070515.html


  (defun override-slime-repl-bindings-with-paredit ()
       (define-key slime-repl-mode-map (read-kbd-macro paredit-backward-delete-key) nil))
  (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)





     (add-hook 'slime-mode-hook 'set-up-slime-hippie-expand)
     (add-hook 'slime-repl-mode-hook 'set-up-slime-hippie-expand)

     (add-hook 'slime-repl-mode-hook (lambda () (setq show-trailing-whitespace nil)))

     (add-hook 'slime-mode-hook 'set-up-slime-ac)
     (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)




     (eval-after-load 'auto-complete '(add-to-list 'ac-modes 'slime-repl-mode))

(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))






(provide 'init-common-lisp)
