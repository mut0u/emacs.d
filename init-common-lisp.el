(show-paren-mode t)

(setq inferior-lisp-program "/usr/bin/sbcl"
      lisp-indent-function 'common-lisp-indent-function
      common-lisp-hyperspec-root "file:/home/savior/.emacs.d/site-lisp/HyperSpec-7-0/HyperSpec/") 
(add-to-list 'load-path "~/.emacs.d/slime")

(require-package 'ac-slime)
(require-package 'hippie-expand-slime)
(setq lisp-indent-function 'common-lisp-indent-function)
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)
(setq slime-truncate-lines t)
(require 'slime)


(slime-setup '(slime-asdf slime-autodoc slime-banner slime-c-p-c ;;slime-cl-indent slime-clipboard 
			       slime-compiler-notes-tree 
                               ;slime-editing-commands ;;slime-enclosing-context 
			       slime-fancy-inspector slime-fancy slime-fontifying-fu slime-fuzzy 
                               ;;slime-highlight-edits 
			       slime-hyperdoc slime-indentation slime-mdot-fu slime-media ;;slime-motd 
			       slime-mrepl 
			       slime-package-fu slime-parse ;;slime-presentation-streams 
			       slime-presentations 
			       slime-references slime-repl slime-sbcl-exts slime-scheme slime-scratch slime-snapshot 
			       slime-sprof slime-tramp ;;slime-typeout-frame ;;muliti-frame 
			       ;;slime-xref-browser
))
(setq lisp-indent-function 'common-lisp-indent-function)


;(slime) ;M-x slime



;; See http://bc.tech.coop/blog/070927.html
(add-auto-mode 'lisp-mode "\\.cl\\'")
(add-hook 'lisp-mode-hook (lambda ()
                            (cond ((not (featurep 'slime))
                                   (require 'slime)
                                   (normal-mode)))))




(defun override-slime-repl-bindings-with-paredit ()
       (define-key slime-repl-mode-map (read-kbd-macro paredit-backward-delete-key) nil))


(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)





(add-hook 'slime-mode-hook 'set-up-slime-hippie-expand)
(add-hook 'slime-repl-mode-hook 'set-up-slime-hippie-expand)
(add-hook 'slime-repl-mode-hook (lambda () (setq show-trailing-whitespace nil)))

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)


(remove-hook 'slime-compilation-finished-hook 'slime-maybe-show-compilation-log)
(add-hook 'slime-compilation-finished-hook 'slime-maybe-list-compiler-notes)



(eval-after-load 'auto-complete '(add-to-list 'ac-modes 'slime-repl-mode))

(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'slime-complete-symbol)
     (define-key lisp-mode-map (kbd "C-c M-l") 'slime-list-compiler-notes)))



;(require 'hyperspec)


(provide 'init-common-lisp)
