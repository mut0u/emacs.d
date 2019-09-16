;;; init-pyim.el --- Configuration for pyim

;; Filename: init-pyim.el
;; Description: Configuration for pyim
;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2018, Andy Stewart, all rights reserved.
;; Created: 2018-09-24 18:01:39
;; Version: 0.1
;; Last-Updated: 2018-09-24 18:01:39
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/init-pyim.el
;; Keywords:
;; Compatibility: GNU Emacs 27.0.50
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
;; Configuration for pyim
;;

;;; Installation:
;;
;; Put init-pyim.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-pyim)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-pyim RET
;;

;;; Change log:
;;
;; 2018/09/24
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
(require 'posframe)
(require 'pyim)
(require 'liberime)

;;; Code:

(setq default-input-method "pyim")
(setq pyim-page-tooltip 'posframe)
(setq pyim-fuzzy-pinyin-alist
      '(("en" "eng") ("in" "ing") ("l" "n") ("z" "zh") ("c" "ch")))
(setq pyim-punctuation-translate-p '(auto yes no))
(setq-default pyim-english-input-switch-functions
              '(pyim-probe-isearch-mode))
(setq pyim-page-length 9)
(setq pyim-posframe-min-width 0)
(setq pyim-dcache-backend 'pyim-dregcache)

;; Rime配置
(liberime-start
 (if (featurep 'cocoa)
     "/Library/Input Methods/Squirrel.app/Contents/SharedSupport"
   "/usr/share/rime-data")
 (file-truename "~/.emacs.d/pyim/rime/"))

(liberime-select-schema "luna_pinyin_simp")
(setq pyim-default-scheme 'rime-quanpin)

(setq pyim-page-length 9)
(global-set-key (kbd "C-\\") 'toggle-input-method)

(provide 'init-pyim)

;;; init-pyim.el ends here
