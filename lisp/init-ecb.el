;;; init-ecb.el --- Init ecb

;; Filename: init-ecb.el
;; Description: Init ecb
;; Author: Andy Stewart <andy@freedom>
;; Maintainer: Andy Stewart <andy@freedom>
;; Copyright (C) 2013, Andy Stewart, all rights reserved.
;; Created: 2013-12-30 15:00:16
;; Version: 0.1
;; Last-Updated: 2013-12-30 15:00:16
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/init-ecb.el
;; Keywords: 
;; Compatibility: GNU Emacs 24.3.50.1
;;
;; Features that might be required by this library:
;;
;; 
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary: 
;; 
;; Init ecb
;; 

;;; Installation:
;;
;; Put init-ecb.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-ecb)
;;
;; No need more.

;;; Customize:
;;
;; 
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-ecb RET
;;

;;; Change log:
;;	
;; 2013/12/30
;;      * First released.
;; 

;;; Acknowledgements:
;;
;; 
;;

;;; TODO
;;
;; 
;;

;;; Require


;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ECB ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-ecb-alist nil
  "The `one-key' menu alist for ECB.")

(setq one-key-menu-ecb-alist
      '(
        (("s" . "Sources") . ecb-goto-window-sources)
        (("h" . "History") . ecb-goto-window-history)
        (("d" . "Directory") . ecb-goto-window-directories)
        (("m" . "Methods") . ecb-goto-window-methods)
        (("e" . "Edit") . ecb-goto-window-edit1)))

(defun one-key-menu-ecb ()
  "The `one-key' menu for ECB."
  (interactive)
  (one-key-menu "ECB" one-key-menu-ecb-alist t))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(ecb-auto-activate t)
 '(ecb-clear-caches-before-activate nil)
 '(ecb-compilation-buffer-names (quote (("*Calculator*") ("*vc*") ("*vc-diff*") ("*Apropos*") ("*Occur*") ("*shell*") ("\\*[cC]ompilation.*\\*" . t) ("\\*i?grep.*\\*" . t) ("*JDEE Compile Server*") ("*Help*") ("*Completions*") ("*Backtrace*") ("*Compile-log*") ("*bsh*") ("*Messages*") ("*slime-events*") ("*inferior-lisp*") ("*prolog*"))))
 '(ecb-compilation-major-modes (quote (compilation-mode slime-repl-mode)))
 '(ecb-compile-window-height 0.3)
 '(ecb-compile-window-width (quote edit-window))
 '(ecb-display-default-dir-after-start t)
 '(ecb-enlarged-compilation-window-max-height 1.0)
 '(ecb-layout-always-operate-in-edit-window (quote (delete-other-windows switch-to-buffer)))
 '(ecb-options-version "2.40")
 '(ecb-other-window-behavior (quote edit-and-compile))
 '(ecb-select-edit-window-on-redraw t)
 '(ecb-source-path (quote ("~")))
 '(ecb-split-edit-window-after-start nil)
 '(ecb-tip-of-the-day nil)
 '(ecb-windows-width 0.2)
;;;;;; '(ede-project-directories (quote nil))
;;;;;; '(global-auto-highlight-symbol-mode t)
;;;;;; '(global-hl-line-mode t)
;;;;;; '(global-linum-mode t)
;;;;;; '(global-semantic-decoration-mode t nil (semantic-decorate-mode))
;;;;;; '(global-semantic-highlight-edits-mode t nil (semantic-util-modes))
;;;;;; '(global-semantic-highlight-func-mode t nil (semantic-util-modes))
;;;;;; '(global-semantic-idle-local-symbol-highlight-mode t nil (semantic-idle))
;;;;;; '(global-semantic-idle-scheduler-mode t nil (semantic-idle))
;;;;;; '(global-semantic-idle-summary-mode t nil (semantic-idle))
;;;;;; '(global-semantic-mru-bookmark-mode t nil (semantic-util-modes))
;;;;;; '(global-semantic-show-parser-state-mode t nil (semantic-util-modes))
;;;;;; '(global-semantic-tag-folding-mode t nil (semantic-util-modes))
;;;;;; '(global-semanticdb-minor-mode t)
;;;;;; 
;;;;;; 
;;;;;; '(semantic-edits-verbose-flag nil)
;;;;;; '(semantic-idle-summary-function (quote semantic-format-tag-summarize-with-file))
;;;;;; '(semantic-idle-work-parse-neighboring-files-flag t)
;;;;;; '(semantic-idle-work-update-headers-flag t)
;;;;;; '(semantic-tag-folding-show-tooltips t)

)

 (global-ede-mode 1) 
(provide 'init-ecb)

;;; init-ecb.el ends here
