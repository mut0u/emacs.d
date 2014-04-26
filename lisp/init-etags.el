;; -*- Emacs-Lisp -*-
;;; init-etags.el ---
;; Time-stamp: <2014-03-01 17:04:08 Saturday by lzy>

;; Copyright (C) 2014 zhengyu li
;;
;; Author: zhengyu li <lizhengyu419@gmail.com>
;; Keywords: none

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-etags)

;;; Require

(require 'etags-extension)

;;; Code:

;(setq tags-default-target-directory my-emacs-path)
(setq tags-default-storage-directory "~/.emacs.d/Etags")

(unless (file-exists-p tags-default-storage-directory)
  (make-directory tags-default-storage-directory t))

(lazy-set-key
 '(("M-," . nil))
 esc-map)

(lazy-set-key
 '(("<f7>" . visit-tags-table)
   ("C-<f7>" . generate-tag-table)
   ("M-." . find-tag)
   ("M-," . pop-tag-mark)))

;;; provide features
(provide 'init-etags)

;;; init-etags.el ends here
