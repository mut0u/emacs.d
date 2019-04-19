;;; init-paredit.el --- Configure paredit structured editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'paredit)
(require 'awesome-pair)

(defun maybe-map-paredit-newline ()
  (unless (or (memq major-mode '(inferior-emacs-lisp-mode cider-repl-mode python-mode))
              (minibufferp))
    (local-set-key (kbd "RET") 'paredit-newline)))

(defun maybe-map-paredit-new-key ()
  (when (memq major-mode '(python-mode))
    (message "hello##")
    (define-key paredit-mode-map (read-kbd-macro "(") 'awesome-pair-open-round)
    (define-key paredit-mode-map (kbd "DEL") 'awesome-pair-backward-delete)
    (local-set-key (kbd "DEL") 'awesome-pair-backward-delete)))

(add-hook 'paredit-mode-hook 'maybe-map-paredit-newline)
(add-hook 'paredit-mode-hook 'maybe-map-paredit-new-key)

(after-load 'paredit
  (diminish 'paredit-mode " Par")
  ;; Suppress certain paredit keybindings to avoid clashes, including
  ;; my global binding of M-?
  (dolist (binding '("C-<left>" "C-<right>" "C-M-<left>" "C-M-<right>" "M-s" "M-?"))
    (define-key paredit-mode-map (read-kbd-macro binding) nil)))


;; Compatibility with other modes

(sanityinc/suspend-mode-during-cua-rect-selection 'paredit-mode)


;; Use paredit in the minibuffer
;; TODO: break out into separate package
;; http://emacsredux.com/blog/2013/04/18/evaluate-emacs-lisp-in-the-minibuffer/
(add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)

(defvar paredit-minibuffer-commands '(eval-expression
                                      pp-eval-expression
                                      eval-expression-with-eldoc
                                      ibuffer-do-eval
                                      ibuffer-do-view-and-eval)
  "Interactive commands for which paredit should be enabled in the minibuffer.")

(defun conditionally-enable-paredit-mode ()
  "Enable paredit during lisp-related minibuffer commands."
  (if (memq this-command paredit-minibuffer-commands)
      (enable-paredit-mode)))

;; ----------------------------------------------------------------------------
;; Enable some handy paredit functions in all prog modes
;; ----------------------------------------------------------------------------

(require-package 'paredit-everywhere)
(after-load 'paredit-everywhere
  (define-key paredit-everywhere-mode-map (kbd "M-s") nil))
(add-hook 'prog-mode-hook 'paredit-everywhere-mode)

;; remove ( with paredit when python

(dolist (hook (list
               'c-mode-common-hook
               'c-mode-hook
               'c++-mode-hook
               'haskell-mode-hook
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               'ielm-mode-hook
               'sh-mode-hook
               'python-mode-hook
               'js-mode-hook
               'go-mode-hook
               'rust-mode-hook
               'qmake-mode-hook
               'minibuffer-inactive-mode-hook
               ))
  (add-hook hook '(lambda () (awesome-pair-mode 1))))

(provide 'init-paredit)
;;; init-paredit.el ends here
