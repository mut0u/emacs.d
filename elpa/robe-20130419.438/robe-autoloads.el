;;; robe-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (robe-mode) "robe" "robe.el" (20849 12938 761924
;;;;;;  270000))
;;; Generated autoloads from robe.el

(autoload 'robe-mode "robe" "\
Improved navigation for Ruby

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (robe-ac-available) "robe-ac" "robe-ac.el" (20849
;;;;;;  12938 725924 269000))
;;; Generated autoloads from robe-ac.el

(autoload 'robe-ac-available "robe-ac" "\
Return t if `robe-mode' completions are available, otherwise nil.

\(fn)" nil nil)

(defconst ac-source-robe '((available . robe-ac-available) (candidates . robe-ac-candidates) (document . robe-ac-doc) (symbol . "r")) "\
`auto-complete' completion source for Ruby using `robe-mode'.")

;;;***

;;;### (autoloads (company-robe) "robe-company" "robe-company.el"
;;;;;;  (20849 12938 745924 269000))
;;; Generated autoloads from robe-company.el

(autoload 'company-robe "robe-company" "\
A `company-mode' completion back-end for `robe-mode'.

\(fn COMMAND &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("robe-pkg.el") (20849 12939 8884 596000))

;;;***

(provide 'robe-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; robe-autoloads.el ends here
