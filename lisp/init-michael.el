;;; author savior






;;;; highlight-parentheses

;; highlight-indentation
;;(add-hook 'slime-mode-hook 'highlight-indentation-current-column-mode)
;;(add-hook 'slime-repl-mode-hook 'highlight-indentation-current-column-mode)










;;;; rainbow-delimiters.el






;;;
;;;;; tabbar again
;;;(defun tabbar-buffer-groups ()
;;;  "Return the list of group names the current buffer belongs to.
;;; This function is a custom function for tabbar-mode's tabbar-buffer-groups.
;;; This function group all buffers into 2 groups, depending to the result value of `ecb-compilation-buffer-p'.
;;; This allows grouping in eclipse style."
;;;  (cond
;;;   ((ecb-compilation-buffer-p (buffer-name))
;;;    '("Compilation Buffers"))
;;;   (t
;;;    '("Editing Buffers"))))
;;;(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)
;;;(tabbar-mode)
