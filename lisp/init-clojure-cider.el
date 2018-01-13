(require 'init-clojure)

(when (maybe-require-package 'cider)
  (setq nrepl-popup-stacktraces nil)

  (after-load 'cider
    (add-hook 'cider-mode-hook 'eldoc-mode)
    (add-hook 'cider-repl-mode-hook 'subword-mode)
    (add-hook 'cider-repl-mode-hook 'paredit-mode)

    ;; nrepl isn't based on comint
    (add-hook 'cider-repl-mode-hook 'sanityinc/no-trailing-whitespace)
    (add-hook 'cider-repl-mode-hook
              (lambda ()
                (setq cider-repl-display-help-banner nil)
                )))

  (require-package 'flycheck-clojure)
  (after-load 'clojure-mode
    (after-load 'cider
      (after-load 'flycheck
        (flycheck-clojure-setup)))))

(defun michael/def ()
  (interactive)
  (let* ((begin (region-beginning))
         (end (region-end))
         (index1 begin)
         (index2 (save-excursion (goto-char begin) (forward-sexp) (forward-sexp) (point))))
    (while (<= index2 end)
      (cider-interactive-eval (concat "(def "
                                      (buffer-substring-no-properties
                                       index1
                                       index2)  ")" ))
      (setf index1 index2)
      (setf index2 (progn
                     (goto-char index2)
                     (forward-sexp)
                     (forward-sexp)
                     (point)))))
  (pop-to-mark-command))


(defun michael/create-test-file ()
  (interactive)
  (let* ((file-path (buffer-file-name))
         (project-path-index (string-match-p "src" file-path)))
    (if (not project-path-index)
        (message "This is not a project file.")
      (let* ((project-path (substring file-path 0 project-path-index))
             (src-file-path (substring file-path (+ project-path-index 3)))
             (test-file-path (concat project-path
                                     "test"
                                     (substring src-file-path
                                                0
                                                (string-match-p ".clj$" src-file-path))
                                     "_test.clj")))
        (if (not (file-exists-p test-file-path))
            (let ((namespace (replace-regexp-in-string
                              "/" "."
                              (replace-regexp-in-string "_" "-"
                                                        (concat (first (split-string
                                                                        (substring src-file-path 1) "\\.")) "_test")))))
              (with-current-buffer
                  (switch-to-buffer (find-file-noselect test-file-path nil nil t))
                (insert (format "(ns %s\n)" namespace) ))))
        (switch-to-buffer (find-file-noselect test-file-path))))))




(after-load 'cider-repl
  (setq cider-eval-result-duration 2)
  (define-key cider-repl-mode-map (kbd "C-c C-x") nil)
  (define-key cider-repl-mode-map (kbd "C-c M-o") #'cider-repl-clear-buffer))

(provide 'init-clojure-cider)
