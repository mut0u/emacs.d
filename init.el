;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver "23.3"))
  (when (version<= emacs-version "23.1")
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version<= emacs-version "24")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'wgrep)
(require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'mwe-log-commands)
(require 'lazy-set-key)
(require 'tabbar)

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-proxies)
(require 'init-dired)
(require 'init-isearch)
(require 'init-uniquify)
(require 'init-ibuffer)
;;(require 'init-flycheck)

(require 'init-recentf)
(require 'init-ido)

(require 'init-auto-save)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-windows)
(require 'init-sessions)
(require 'init-w3m)


(when (display-graphic-p)
  (require 'init-fonts))

(require 'init-mmm)
(require 'init-editing-utils)
(require 'init-vc)
(require 'init-darcs)
(require 'init-git)
(require 'init-github)
(require 'init-compile)
(require 'init-crontab)
(require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
(require 'init-erlang)
(require 'init-javascript)
(require 'init-php)
(require 'init-org)
(require 'init-nxml)
(require 'init-html)
(require 'init-css)
(require 'init-haml)
(require 'init-python)
(require 'init-haskell)
(require 'init-ruby-mode)
(require 'init-rails)
(require 'init-sql)
(require 'init-paredit)
(require 'init-lisp)
(require 'init-slime)
(require 'init-clojure)
(when (>= emacs-major-version 24)
  (require 'init-clojure-cider))
(require 'init-common-lisp)
(require 'init-org2blog)
(require 'init-ecb)
(require 'init-doc-view)
(require 'init-chm-view)

;; (when *spell-check-support-enabled*
;;  (require 'init-spelling))


(when *spell-check-support-enabled*
  (require 'init-spelling))

;;;(require 'init-marmalade);; purcell-remove
(require 'init-misc)

(require 'init-dash)
(require 'init-ledger)
;; Extra packages which don't require any configuration

(require-package 'gnuplot)
(require-package 'lua-mode)
(require-package 'htmlize)
(require-package 'dsvn)
(when *is-a-mac*
  (require-package 'osx-location))
(require-package 'regex-tool)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
  (error "Please move init-local.el to ~/.emacs.d/lisp"))
(require 'init-local nil t)


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

(add-hook 'after-init-hook
          (lambda ()
            (message "init completed in %.2fms"
                     (sanityinc/time-subtract-millis after-init-time before-init-time))))


;;---------------------------------------------------------------
;;init key bounding
;;----------------------------------------------------------------
;;;(require 'init-company-mode)   ;;; maybe not use this configure
(require 'init-mew)
(require 'init-key)
(require 'init-backup)
(require 'init-yasnippet)
(require 'init-doxymacs)
(require 'init-tabbar)
;(require 'init-minibuffer-tray)
;;;(require 'init-webkit)
(require 'init-eim)
(require 'init-etags)
(require 'init-weibo)
;;;(require 'init-webqq)
(require 'init-ppt)
;;(require 'init-ediff)
(require 'remote-emacsclient)
(update-tramp-emacs-server-port-forward tramp-default-method)

(when *is-a-mac*
  (setq save-interprogram-paste-before-kill nil))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
