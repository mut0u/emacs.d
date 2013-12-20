
(require 'auto-complete-config)

(defface popup-mouse-face
  '((t (nil)))
  "Face for popup mouse"
  :group 'popup)

(defadvice ac-error (after reopen-ac-mode activate)
  "reopen auto-complete-mode after ac-error"
  (auto-complete-mode 1))

(defun ac-settings-4-lisp ()
  "auto-complete settings for lisp mode"
  (setq ac-sources
        (append
         '(ac-source-features
           ac-source-functions
           ac-source-yasnippet
           ac-source-variables
           ac-source-symbols)
         ac-sources)))

(defun ac-settings-4-cc ()
  "auto-complete settings for cc mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet)
         ac-sources)))

(defun ac-settings-4-c/c++ ()
  "auto-complete settings for c/c++ mode"
  ;; required features
  (require 'auto-complete-clang)
  ;; functions definition
  (defun set-ac-clang-flags ()
    "-I flags for auto-complete clang source"
    (let (begin end result)
      (if (executable-find "g++")
          (with-temp-buffer
            (shell-command-surpress-popup-window "echo''|g++ -v -x c++ -E -"
                                                 (buffer-name (current-buffer)))
            (goto-char (point-min))
            (setq begin (progn
                          (search-forward "#include <...>")
                          (next-line)
                          (line-beginning-position)))
            (setq end (progn
                        (search-forward "End of search list")
                        (previous-line)
                        (line-end-position)))
            (setq result (buffer-substring begin end))))
      (setq ac-clang-flags
            (mapcar #'(lambda (item)
                        (concat "-I" item))
                    (split-string (concat "./\n./include\n../include\n../../include\n../../../include\n" result))))
      ;; kill command history buffer
      (if (get-buffer ".bash_history")
          (kill-buffer ".bash_history"))))
  ;; settings
  (set-ac-clang-flags)
  ;; remove ac-source-yasnippet and ac-source-clang
  (setq ac-sources (delq 'ac-source-yasnippet ac-sources))
  (setq ac-sources (delq 'ac-source-clang ac-sources))
  (setq ac-sources
        (append
         '(ac-source-clang ac-source-yasnippet)
         ac-sources)))

(defun ac-settings-4-python ()
  "auto-complete settings for python mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet)
         ac-sources)))

(defun ac-settings-4-text ()
  "auto-complete settings for text mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet
           ac-source-imenu)
         ac-sources)))

(defun ac-settings-4-org ()
  "auto-complete settings for org mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet
           ac-source-imenu)
         ac-sources)))

(defun ac-settings-4-markdown ()
  "auto-complete settings for markdown mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet)
         ac-sources)))

(defun ac-settings-4-nxml ()
  "auto-complete settings for html/xml etc. mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet
           ac-source-css-property
           ac-source-imenu)
         ac-sources)))

(defun ac-settings-4-eshell ()
  "auto-complete settings for eshell mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet
           ac-source-imenu)
         ac-sources)))

;; basic settings
(setq ac-dwim t)
(setq ac-auto-start 1)
(setq ac-disable-faces nil)
(setq ac-candidate-limit 30)
(setq ac-auto-show-menu 0.4)
(setq ac-quick-help-delay 0.5)
(setq help-xref-following nil)
;; auto-complete auto start modes
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'html-mode)
(add-to-list 'ac-modes 'nxml-mode)
(add-to-list 'ac-modes 'awk-mode)
(add-to-list 'ac-modes 'cmake-mode)
(add-to-list 'ac-modes 'markdown-mode)
(add-to-list 'ac-dictionary-directories
             (concat "~/.emacs/" "Dict"))
(custom-set-variables
 '(ac-trigger-commands-on-completing
   (append '(c-electric-backspace
             c-electric-backspace-kill)
           ac-trigger-commands-on-completing)))
(setq-default ac-sources
              '(ac-source-abbrev
                ac-source-dictionary
                ac-source-words-in-same-mode-buffers
                ac-source-files-in-current-dir
                ac-source-filename))
(add-hook 'lisp-mode-hook 'ac-settings-4-lisp)
(add-hook 'emacs-lisp-mode-hook 'ac-settings-4-lisp)
(add-hook 'lisp-interaction-mode-hook 'ac-settings-4-lisp)
(add-hook 'c-mode-common-hook 'ac-settings-4-cc)
(add-hook 'c-mode-hook 'ac-settings-4-c/c++)
(add-hook 'c++-mode-hook 'ac-settings-4-c/c++)
(add-hook 'python-mode-hook 'ac-settings-4-python)
(add-hook 'text-mode-hook 'ac-settings-4-text)
(add-hook 'org-mode-hook 'ac-settings-4-org)
(add-hook 'markdown-mode-hook 'ac-settings-4-markdown)
(add-hook 'html-mode-hook 'ac-settings-4-nxml)
(add-hook 'xml-mode-hook 'ac-settings-4-nxml)
(add-hook 'eshell-mode-hook 'ac-settings-4-eshell)
;; key bindings
(lazy-set-key
 '(("M-/" . ac-complete-yasnippet)))
;; enable global auto-complete mode
(global-auto-complete-mode 1)

;;; provide features
(provide 'init-autocomplete)