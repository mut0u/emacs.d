;; See http://bc.tech.coop/blog/070927.html
(add-auto-mode 'lisp-mode "\\.cl\\'")
(add-hook 'lisp-mode-hook (lambda ()
                            (unless (featurep 'slime)
                              (require 'slime)
                              (normal-mode))))

(after-load 'slime
  (slime-setup '(slime-asdf slime-autodoc slime-banner
                               slime-compiler-notes-tree
                               slime-fancy-inspector slime-fancy slime-fontifying-fu slime-fuzzy
                               slime-hyperdoc slime-indentation
                               slime-presentations
))

  (when (executable-find "sbcl")
    (add-to-list 'slime-lisp-implementations
                 '(sbcl ("sbcl") :coding-system utf-8-unix)))
  (when (executable-find "lisp")
    (add-to-list 'slime-lisp-implementations
                 '(cmucl ("lisp") :coding-system iso-latin-1-unix))))


(setq common-lisp-hyperspec-root (concat "file:" (expand-file-name "site-lisp/HyperSpec-7-0/HyperSpec/" user-emacs-directory )))




;; From http://bc.tech.coop/blog/070515.html
(defun lispdoc ()
  "Searches lispdoc.com for SYMBOL, which is by default the symbol currently under the curser"
  (interactive)
  (let* ((word-at-point (word-at-point))
         (symbol-at-point (symbol-at-point))
         (default (symbol-name symbol-at-point))
         (inp (read-from-minibuffer
               (if (or word-at-point symbol-at-point)
                   (concat "Symbol (default " default "): ")
                 "Symbol (no default): "))))
    (if (and (string= inp "") (not word-at-point) (not
                                                   symbol-at-point))
        (message "you didn't enter a symbol!")
      (let ((search-type (read-from-minibuffer
                          "full-text (f) or basic (b) search (default b)? ")))
        (browse-url (concat "http://lispdoc.com?q="
                            (if (string= inp "")
                                default
                              inp)
                            "&search="
                            (if (string-equal search-type "f")
                                "full+text+search"
                              "basic+search")))))))

(define-key lisp-mode-map (kbd "C-c l") 'lispdoc)






;(r 'slime-compilation-finished-hook 'slime-maybe-show-compilation-log)
;

(setq slime-compilation-finished-hook '(

 slime-list-compiler-notes
             slime-maybe-list-compiler-notes
            ;; slime-maybe-show-compilation-log

            ))



     ;; slime-maybe-list-compiler-notes


(provide 'init-common-lisp)
