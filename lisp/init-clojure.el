;; See also init-clojure-cider.el

(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . clojure-mode))
(add-to-list 'auto-mode-alist '(".lein-env" . clojure-mode))

(when (maybe-require-package 'clojure-mode)
  (require-package 'cljsbuild-mode)
  (require-package 'elein)
  (require-package 'clj-refactor)
  (after-load 'clojure-mode
    (put-clojure-indent 'defrecord+ '(2 nil nil (1)))
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m")
    (add-hook 'clojure-mode-hook 'sanityinc/lisp-setup)
    (add-hook 'clojure-mode-hook 'paredit-mode)
    (add-hook 'clojure-mode-hook 'subword-mode)))


(add-hook 'before-save-hook 'delete-trailing-whitespace)


(eval-after-load 'page-break-lines
  '(push 'clojure-mode page-break-lines-modes))

(provide 'init-clojure)
