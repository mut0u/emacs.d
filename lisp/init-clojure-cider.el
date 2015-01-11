(require 'init-clojure)
(require-package 'emacs '(24))

(require-package 'cider)
(require-package 'ac-cider)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nrepl with Clojure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq nrepl-popup-stacktraces nil)


(require 'cider-interaction)

(defun michael/eval-form (form)
  (let* (
         (ns-form (if (cider-ns-form-p form) "" (format "(ns %s)" (cider-current-ns)))))
    (with-current-buffer (get-buffer-create cider-read-eval-buffer)
      (erase-buffer)
      (clojure-mode)
      (unless (string= "" ns-form)
        (insert ns-form "\n\n"))
      (let ((start-pos (point)))
        (insert form)
        (cider-interactive-eval form start-pos)))))


(defun michael/def ()
  (interactive)
  (let* ((begin  (region-beginning) )
         (end (region-end))
         (index1 begin)
         (index2 (save-excursion (goto-char begin) (forward-sexp) (forward-sexp) (point))))
    (while (<= index2 end)
      (michael/eval-form (concat "(def "
                                 (buffer-substring-no-properties
                                  index1
                                  index2
                                  )  ")" ))
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
        (when (not (file-exists-p test-file-path))
          (let ((namespace (replace-regexp-in-string
                            "/" "."
                            (replace-regexp-in-string "_" "-"
                                                      (concat (first (split-string
                                                                      (substring src-file-path 1) "\\.")) "_test")))))
            ;; need to change create new file with shell command . TODO
            (shell-command (concat "echo '"  (format "(ns %s\n)" namespace)  "' > "  test-file-path))))
        (switch-to-buffer (find-file-noselect test-file-path))))))

(after-load 'cider
  (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
  (add-hook 'cider-mode-hook 'ac-cider-setup)
  (after-load 'auto-complete
    (add-to-list 'ac-modes 'cider-repl-mode))

  (add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
  (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
  (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
  (add-hook 'cider-repl-mode-hook 'subword-mode)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (define-key cider-mode-map (kbd "C-c C-d") 'ac-cider-popup-doc)
  (define-key cider-mode-map (kbd "C-c C-x") nil)
  ;; nrepl isn't based on comint
  (add-hook 'cider-repl-mode-hook
            (lambda () (setq show-trailing-whitespace nil))))

(after-load 'cider-repl
  (define-key cider-repl-mode-map (kbd "C-c C-x") nil)

  )

(provide 'init-clojure-cider)
