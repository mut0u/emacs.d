;;; init-company-mode.el --- Company-mode configuration

;; Filename: init-company-mode.el
;; Description: Company-mode configuration
;; Author: Andy Stewart lazycat.manatee@gmail.com
;; Maintainer: Andy Stewart lazycat.manatee@gmail.com
;; Copyright (C) 2008, 2009, Andy Stewart, all rights reserved.
;; Created: 2008-10-20 09:56:57
;; Version: 0.1
;; Last-Updated: 2008-10-20 09:56:57
;;           By: Andy Stewart
;; URL:
;; Keywords: company-mode
;; Compatibility: GNU Emacs 23.0.60.1
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
;; Company-mode configuration
;;

;;; Installation:
;;
;; Put init-company-mode.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-company-mode)
;;
;; No need more.

;;; Change log:
;;
;; 2008/10/20
;;      First released.
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

(require-package 'company)


(setq company-idle-delay 0.2)           ;延迟时间
(setq company-minimum-prefix-length 1)  ;触发补全的字符数量
(setq company-show-numbers nil)         ;不显示数字


(lazy-unset-key
 '("TAB")
 company-mode-map)                      ;卸载按键
(lazy-unset-key
 '("M-p" "M-n" "M-1"
   "M-2" "M-3" "M-4"
   "M-5" "M-6" "M-7"
   "M-8" "M-9" "M-0"
   "C-m")
 company-active-map)
(lazy-set-key
 '(
   ("M-h" . company-complete-common)    ;补全公共部分
   ("M-H" . company-complete-selection) ;补全选择的
   ("M-w" . company-show-location)      ;显示局部的
   ("M-s" . company-search-candidates)  ;搜索候选
   ("M-S" . company-filter-candidates)  ;过滤候选
   ("M-," . company-select-next)        ;下一个
   ("M-." . company-select-previous)    ;上一个
   )
 company-active-map
 )






                      ;卸载按键


(dolist (hook (list
;               'emacs-lisp-mode-hook
;               'lisp-mode-hook
;               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook
               ))
  (add-hook hook 'company-mode))

(provide 'init-company-mode)

;;; init-company-mode.el ends here
