;; See also init-clojure-cider.el

(when (maybe-require-package 'clojure-mode)
  (require-package 'cljsbuild-mode)
  (require-package 'elein)

  (after-load 'clojure-mode
    (add-hook 'clojure-mode-hook 'sanityinc/lisp-setup)
    (add-hook 'clojure-mode-hook 'subword-mode)))


(add-hook 'before-save-hook 'delete-trailing-whitespace)


(eval-after-load 'page-break-lines
  '(push 'clojure-mode page-break-lines-modes))

(provide 'init-clojure)
