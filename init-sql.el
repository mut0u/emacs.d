;; 
;;(if (not (file-directory-p "~/.emacs/sqlparser"))
;;    (progn
;;      (shell-command "notify-send cloning the sqlparser")
;;      (shell-command "cd ~/.emacs.d && git clone https://github.com/jixiuf/sqlparser")
;;      (shell-command "notify-send finish cloned the sqlparser")))
;; 
;; 
;;(add-to-list 'load-path "~/.emacs.d/sqlparser")
;; 
;; 
;;(require 'sqlparser-mysql-complete)






(require-package 'edbi)
(require-package 'epc)
(require 'epc)
(require-package 'ctable)

(if (not (member 'deferred package-activated-list))
    (auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/deferred.el"))


(if (not (member 'concurrent package-activated-list))
    (auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/concurrent.el"))





;;; 
;;; 
(if (not (member 'mysql package-activated-list))
    (auto-install-from-url "http://www.emacswiki.org/emacs/download/mysql.el"))
;;;(require 'mysql)
;;;(defcustom sql-mysql-data-dictionary
;;;     "select concat('\\(', '\\\"', table_name, '\\\" \\\"', column_name, '\\\"', '\\)') 
;;;     from information_schema.columns 
;;;     order by table_name;"
;;;     "SQL Statement to determine all tables and columns."
;;;     :group 'SQL
;;;     :type 'string)
;;; 
;;; 
;;;(defun sql-mysql-data-dictionary ()
;;;     (interactive)
;;;     ;; FIXME No cleanup
;;;     (setq sql-data-dictionary
;;;        (sql-data-dictionary sql-mysql-data-dictionary)))
(require 'mysql)

(if (not (member 'sql-completion package-activated-list))
    (auto-install-from-url "http://www.emacswiki.org/emacs/download/sql-completion.el"))
(require 'sql-completion)


(defcustom sql-mysql-data-dictionary
     "select concat('\\(', '\\\"', table_name, '\\\" \\\"', column_name, '\\\"', '\\)') 
     from information_schema.columns 
     order by table_name;"
     "SQL Statement to determine all tables and columns."
     :group 'SQL
     :type 'string)


(defun sql-mysql-data-dictionary ()
     (interactive)
     ;; FIXME No cleanup
     (setq sql-data-dictionary
        (sql-data-dictionary sql-mysql-data-dictionary)))



(require 'sql-completion)


(setq mysql-password "root")
(setq sql-interactive-mode-hook
      (lambda ()
        (define-key sql-interactive-mode-map "\t" 'comint-dynamic-complete)
        (sql-mysql-completion-init)))


(provide 'init-sql)
