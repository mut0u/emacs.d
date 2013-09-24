;;; w3m-extension.el --- Emacs-W3m extensions

;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2008, 2009, Andy Stewart, all rights reserved.
;; Created: 2008-06-07 22:06:58
;; Version: 0.2.5
;; Last-Updated: 2008-09-24 15:53:19
;; URL: not distributed yet
;; Keywords: Emacs-W3m, W3m, Google, search
;; Compatibility: GNU Emacs 23.0.60.1

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

;; Features that might be required by this library:
;;
;; `w3m-util' `w3m-proc' `w3m-form' `w3m-lnum' `w3m'
;;

;;; Installation:
;;
;; Copy w3m-extension.el to your load-path and add to your ~/.emacs
;;
;;  (require 'w3m-extension)
;;
;; No more need

;;; Commentary:
;;
;; A collect functions that extension for Emacs-W3m.
;;

;;; Change log:
;;
;;      2013/03/18 last changed by lzy <lizhengyu419@gmail.com>
;;              refactor the code and remove unused functions
;;
;;; Acknowledgments:
;;
;; Emacs guys.
;;

;;; TODO
;;
;; None
;;

;;; required features
(require 'w3m)
(require-package 'revive)
(require 'w3m-util)
(require 'w3m-proc)
(require 'w3m-form)
(require 'w3m-lnum)

;;; Code:

(defvar w3m-search-advance-beautify-string-length 25
  "The length of `SEARCH-OBJECT' show in function `w3m-search-advance'.")

(defvar w3m-search-advance-search-object nil
  "The search object cache that `w3m-search-advance' use.")

(defvar toggle-w3m-with-other-buffer-revive nil
  "Indicate that whether has set windows configuration")

(defun beautify-string (string &optional after)
  "Strip starting and ending whitespace and beautify `STRING'.
Replace any chars after AFTER with '...'.
Argument STRING the string that need beauty."
  (let ((replace-map (list
                      (cons "^[ \t]*" "")
                      (cons "[ \t]*$" "")
                      (cons (concat "^\\(.\\{"
                                    (or (number-to-string after) "10")
                                    "\\}\\).*")
                            "\\1..."))))
    (dolist (replace replace-map)
      (when (string-match (car replace) string)
        (setq string (replace-match (cdr replace) nil nil string))))
    string))

(defun w3m-search-advance (search-url prompt-string &optional coding
                                      prefix-input-string postfix-input-string
                                      search-url-follow search-url-last
                                      foreground upcase-p downcase-p capitalize-p)
  "Advance w3m search function.
   Default, if mark active, will set `SEARCH-OBJECT' with current mark region,
   otherwise, set current word to `SEARCH-OBJECT'.

   Set `SEARCH-URL' for special search.
   Set `PROMPT-STRING' to prompt to user.
   If `CODING' is set, encode `SEARCH-OBJECT' with this coding, default is nil.
   `PREFIX-INPUT-STRING' is for add before `SEARCH-OBJECT'
   `POSTFIX-INPUT-STRING' is for append after `SEARCH-OBJECT'
   `SEARCH-URL-FOLLOW' is a url that follow `SEARCH-URL' for decorate
   `SEARCH-URL-LAST' is a url that at last for decorate `SEARCH-URL'.
   If `FOREGROUND' is non-nil, make search page open foreground, otherwise search in background.
   If `UPCASE-P' is non-nil, upcase `SEARCH-OBJECT'.
   If `downcase-p' is non-nil, downcase `SEARCH-OBJECT'.
   If `capitalize-p' is non-nil, capitalize `SEARCH-OBJECT'."
  (let (search-string
        input-string)
    (setq search-string
          (if mark-active
              ;; when mark active get mark region
              (prog1
                  (buffer-substring (region-beginning) (region-end))
                (deactivate-mark))
            ;; or get current word
            (current-word)))
    ;; kill `search-string' for make user can edit it convenient
    ;; If you want to edit `search-string' by default when input in `read-string'
    ;; just use `w3m-search-advance-insert-search-object' yank and edit. :)
    (if search-string
        (setq w3m-search-advance-search-object search-string)
      (setq search-string ""))
    (setq input-string
          (read-string
           (concat prompt-string
                   (format " (%-s): " (beautify-string search-string w3m-search-advance-beautify-string-length)))))
    ;; set `input-string' with `search-string' if user input nothing
    (if (equal input-string "")
        (setq input-string search-string))
    ;; `input-string' transform.
    (setq input-string
          (cond (upcase-p
                 (upcase input-string))
                (downcase-p
                 (downcase input-string))
                (capitalize-p
                 (capitalize input-string))
                (t input-string)))
    ;; encode `input-string' with `coding'
    (or prefix-input-string (setq prefix-input-string ""))
    (or postfix-input-string (setq postfix-input-string ""))
    (or search-url-follow (setq search-url-follow ""))
    (or search-url-last (setq search-url-last ""))
    (setq input-string (w3m-url-encode-string (concat prefix-input-string input-string postfix-input-string) coding))
    (setq search-url (concat search-url search-url-follow input-string search-url-last))
    (if foreground
        (w3m-browse-url search-url t)         ;search foreground
      (w3m-view-this-url-1 search-url nil t)) ;search background
    ))

(defun w3m-search-advance-insert-search-object ()
  "Insert search object of `w3m-search-advance' into minibuffer."
  (interactive)
  (if w3m-search-advance-search-object
      (insert w3m-search-advance-search-object)))

(defun w3m-search-slang ()
  "Translate input word and search from urbandictionary.com."
  (interactive)
  (w3m-search-advance "http://www.urbandictionary.com/define.php?term=" "English Slang" 'utf-8))

(defun w3m-search-dict-cn ()
  "Translate input word and search from dict.cn."
  (interactive)
  (w3m-search-advance "http://dict.cn/search/?q=" "English Dict.cn" 'gbk))

(defun w3m-search-google-lucky ()
  "Use Google Lucky search for WHAT."
  (interactive)
  (w3m-search-advance "http://www.google.com/search?btnI=I%27m+Feeling+Lucky&q=" "Google Lucky" 'utf-8))

(defun w3m-search-google-image ()
  "Use Google image search for WHAT."
  (interactive)
  (w3m-search-advance "http://images.google.com/images?sa=N&tab=wi&q=" "Google Image" 'utf-8))

(defun w3m-search-google-blog-cn ()
  "Use Google (Chinese) blog search for WHAT."
  (interactive)
  (w3m-search-advance "http://blogsearch.google.com/blogsearch?hl=zh-CN&ie=UTF-8&oe=UTF-8&q=" "Google Blog CN" 'utf-8))

(defun w3m-search-google-blog-en ()
  "Use Google (English) blog search for WHAT."
  (interactive)
  (w3m-search-advance "http://blogsearch.google.com/blogsearch?hl=en&ie=UTF-8&oe=UTF-8&q=" "Google Blog EN" 'utf-8))

(defun w3m-search-google-group ()
  "Use Google group search for WHAT."
  (interactive)
  (w3m-search-advance "http://groups.google.com/groups?hl=zh-CN&ie=UTF-8&oe=UTF-8&q=" "Google Group" 'utf-8))

(defun w3m-search-google-file ()
  "Use Google to search for a file named FILE.
This function add little Google search syntax, make search file simply.
Example, your want search pdf of chm about Emacs, you just type emacs pdf|chm."
  (interactive)
  (w3m-search-advance "http://www.google.com/search?&ie=UTF-8&oe=UTF-8&q=" "Google File" 'utf-8
                      "+intitle:(\"index of\"\|\"last modified\"\|\"parent of\") -inurl:htm -inurl:html -inurl:php -inurl:asp "))

(defun w3m-search-baidu-mp3 ()
  "Search mp3 from mp3.baidu.com."
  (interactive)
  (w3m-search-advance "http://mp3.baidu.com/m?f=ms&tn=baidump3&ct=134217728&lf=&rn=&lm=0&word=" "Baidu Mp3 Search" 'gbk))

(defun w3m-search-emacswiki ()
  "Search from EmacsWiki's Google Custom Search."
  (interactive)
  (w3m-search-advance "http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&q=" "Emacswiki" 'utf-8))

(defun w3m-search-emacswiki-random ()
  "Get the random pages from emacswiki."
  (interactive)
  (w3m-view-this-url-1 "http://www.emacswiki.org/cgi-bin/wiki?action=random" nil t))

(defun w3m-search-haskell-wiki ()
  "Search from HaskellWiki's Google Custom Search."
  (interactive)
  (w3m-search-advance "http://www.google.com/cse?cx=014102838545582129901%3Anhonl7a8bw8&q=" "Haskell Wiki" 'utf-8))

(defun w3m-search-rfc-number ()
  "Search RFC number from www.ietf.org."
  (interactive)
  (w3m-search-advance "http://www.ietf.org/rfc/rfc" "RFC Number" 'utf-8 nil ".txt"))

(defun w3m-search-lispdoc-basic ()
  "Search object in lispdoc.com with `basic-search'."
  (interactive)
  (w3m-search-advance "http://lispdoc.com?q=" "Lispdoc basic search" nil nil nil nil "&search=Basic+search/"))

(defun w3m-search-lispdoc-full ()
  "Search object in lispdoc.com with `full-search'."
  (interactive)
  (w3m-search-advance "http://lispdoc.com?q=" "Lispdoc basic search" nil nil nil nil "&search=Full+search/"))

(defun w3m-search-google-web-cn ()
  "Search object in www.google.cn."
  (interactive)
  (w3m-search-advance "http://www.google.cn/search?&hl=zh-CN&lr=lang_zh-CN%7Clang_zh-TW&inlang=zh-CN&q=" "Google Web CN" 'utf-8))

(defun w3m-search-google-web-en ()
  "Use Google (English) to search for WHAT."
  (interactive)
  (w3m-search-advance "http://www.google.com/search?&ie=UTF-8&oe=UTF-8&q=" "Google Web EN" 'utf-8))

(defun w3m-search-answers ()
  "Search object in www.answers.com."
  (interactive)
  (w3m-search-advance "http://www.answers.com/" "answers.com" 'utf-8))

(defun w3m-search-haskell-hoogle ()
  "Search object in haskell.org/hoogle/."
  (interactive)
  (w3m-search-advance "http://haskell.org/hoogle/?hoogle=" "Haskell Hoogle" 'utf-8))

(defun w3m-search-wikipedia-cn ()
  "Search object in zh.wikipedia.org."
  (interactive)
  (w3m-search-advance "http://zh.wikipedia.org/wiki/" "zh.wikipedia.org" 'utf-8))

(defun w3m-search-wikipedia-en ()
  "Search object in en.wikipedia.org."
  (interactive)
  (w3m-search-advance "http://en.wikipedia.org/wiki/" "en.wikipedia.org" 'utf-8))

(defun w3m-search-google-news-cn-Sci/Tech ()
  "Look up Google technology news."
  (interactive)
  (w3m-view-this-url-1 "http://news.google.cn/nwshp?tab=wn&ned=tcn&topic=t" nil t))

(defun w3m-search-google-news-en-Sci/Tech ()
  "Use Google news search for WHAT."
  (interactive)
  (w3m-view-this-url-1 "http://news.google.com/news?ned=tus&topic=t" nil t))

(defun toggle-w3m-with-other-buffer ()
  "Switch to a w3m buffer or return to the previous buffer."
  (interactive)
  (let ((current-url (thing-at-point 'url))
        (buffers (buffer-list)))
    (if (derived-mode-p 'w3m-mode)
        ;; Currently in a w3m buffer
        (if toggle-w3m-with-other-buffer-revive
            (progn
              (resume 1024)
              (setq toggle-w3m-with-other-buffer-revive nil))
            ;; Bury buffers until you reach a non-w3m one
          (while (derived-mode-p 'w3m-mode)
            (bury-buffer)))
      ;; Not in w3m
      ;; Find the first w3m buffer
      (progn
        (setq toggle-w3m-with-other-buffer-revive t)
        (save-current-configuration 1024)
        (if current-url
            (if (y-or-n-p (format "visit url: %s" current-url))
                (progn
                  (w3m-browse-url current-url t)
                  (delete-other-windows))
              (switch-to-w3m-buffer buffers))
          (switch-to-w3m-buffer buffers))))))

(defun switch-to-w3m-buffer (buffers)
  (while buffers
    (if (with-current-buffer (car buffers)
          (derived-mode-p 'w3m-mode))
        (progn
          (switch-to-buffer (car buffers))
          (delete-other-windows)
          (setq buffers nil))
      (setq buffers (cdr buffers))))
  (unless (derived-mode-p 'w3m-mode)
    (call-interactively 'w3m)
    (delete-other-windows)))

(defun w3m-startup-background ()
  "Startup w3m background."
  (interactive)
  (w3m-view-this-url-1 (w3m-input-url nil nil nil w3m-quick-start
                                      'feeling-lucky) nil t))

(defun w3m-delete-buffer-and-select ()
  "Delete current w3m buffer.
If current tab is at right side of tabs, select left tab, otherwise, select right tab."
  (interactive)
  (if (require 'tabbar nil t)
      (let* ((tabset (tabbar-current-tabset t))
             (search-prev nil)
             selected tab)
        (when tabset
          (setq selected (tabbar-selected-tab tabset))
          (setq tab (tabbar-tab-next tabset selected search-prev))
          (setq search-prev (not tab))
          (setq tab (tabbar-tab-next tabset selected search-prev))
          (w3m-delete-buffer 1)
          (if tab                       ;if tab is not right side of tabs
              (if search-prev
                  (tabbar-backward-tab)
                (tabbar-forward-tab))
            (if toggle-w3m-with-other-buffer-revive
                (progn
                  (resume 1024)
                  (setq toggle-w3m-with-other-buffer-revive nil))))))))

(defun w3m-visual-scroll-up (&optional arg)
  "Visual scroll up with image and text."
  (interactive)
  (or arg (setq arg 1))
  (if (pos-visible-in-window-p (point-max))
      (message "End of buffer")
    (let ((cur (point))
          pos visible)
      (setq pos
            (save-excursion
              (while (and (search-forward "\n" nil t)
                          (= (length (pos-visible-in-window-p (point) nil t)) 2)))
              (1- (point))))
      (setq visible
            (pos-visible-in-window-p pos nil t))
      ;; if point is fully visible, we can go there
      (when (and (= (length visible) 2)
                 (not (= pos cur)))
        (goto-char pos))
      ;; if point is partly visible, we only go there if we absolutely
      ;; have to (point is already at the top)
      (when (and (= pos cur)
                 (null (pos-visible-in-window-p (1- (point)))))
        (forward-line 1))
      (set-window-vscroll nil (+ (window-vscroll) arg)))))

(defun w3m-visual-scroll-down (&optional arg)
  "Visual scroll down with image and text."
  (interactive)
  (or arg (setq arg 1))
  (if (pos-visible-in-window-p (point-min))
      (message "Beginning of buffer")
    (let ((cur (point))
          pos visible)
      (setq pos
            (save-excursion
              (while (and (search-backward "\n" nil t)
                          (= (length (pos-visible-in-window-p (point) nil t)) 2)))
              (+ 1 (point))))
      (setq visible
            (pos-visible-in-window-p pos nil t))
      (when (and (= (length visible) 2)
                 (not (= pos cur)))
        (goto-char pos))
      (when (and (= pos cur)
                 (null (pos-visible-in-window-p
                        (save-excursion (forward-line 1) (point)))))
        (goto-char (1- (point))))
      (when (zerop (window-vscroll))
        (message "vscroll is 0. Reverting to scroll-down.")
        (scroll-down arg))
      (set-window-vscroll nil (- (window-vscroll) arg)))))

(defun w3m-open-dead-link-with-external-browser ()
  "Automatic open dead link."
  (interactive)
  (call-interactively 'w3m-process-stop)
  (if (search-forward-regexp "Reading " nil t)
      (browse-url-firefox (thing-at-point 'url))))

(defun w3m-copy-link-in-region ()
  "Copy all link in yank at region with buffer."
  (interactive)
  (let* ((regionp (org-region-active-p))
         (transform-start (point-min))
         (transform-end (point-max))
         out-bound)
    (when regionp
      (setq transform-start (region-beginning))
      (setq transform-end (region-end))
      ;; Deactivate mark if current mark is activate.
      (if (fboundp 'deactivate-mark) (deactivate-mark)))
    (message "Copy links...")
    (save-excursion
      (goto-char transform-start)
      (while (and (not out-bound)             ; still inside region to copy
                  (not (w3m-no-next-link-p))) ; no next link current buffer
        ;; move to next anchor.
        (w3m-get-next-link-start)
        (if (<= (point) transform-end)  ; if point is inside transform bound
            ;; get link location at current point.
            (if (w3m-anchor (point))
                (kill-new (w3m-anchor (point))))
          (setq out-bound t)            ; for break out `while' loop
          ))
      (message "Copy links...done."))))

(defun w3m-get-anchor-start ()
  "Move cursor to the start of current anchor. Return point."
  (interactive)
  (goto-char (or (previous-single-property-change (point) 'w3m-anchor-sequence) ;get start position of anchor
                 (point))))

(defun w3m-get-anchor-end ()
  "Move cursor to the end of current anchor. Return point."
  (interactive)
  (goto-char (or (next-single-property-change (point) 'w3m-anchor-sequence) ;get end position of anchor
                 (point))))

(defun w3m-get-next-link-start ()
  "Move cursor to the start of next link. Return point."
  (interactive)
  (catch 'reach
    (while (next-single-property-change (point) 'w3m-anchor-sequence) ;jump to next anchor
      (goto-char (next-single-property-change (point) 'w3m-anchor-sequence))
      (when (w3m-anchor (point))        ;return point when current is valid link
        (throw 'reach nil))))
  (point))

(defun w3m-get-prev-link-start ()
  "Move cursor to the start of previous link. Return point."
  (interactive)
  (catch 'reach
    (while (previous-single-property-change (point) 'w3m-anchor-sequence) ;jump to previous anchor
      (goto-char (previous-single-property-change (point) 'w3m-anchor-sequence))
      (when (w3m-anchor (point))        ;return point when current is valid link
        (throw 'reach nil))))
  (point))

(defun w3m-no-next-link-p ()
  "Whether there is no next link after the cursor.
Return t if there is no next link; otherwise, return nil."
  (save-excursion
    (equal (point) (w3m-get-next-link-start))))

(defun w3m-no-prev-link-p ()
  "Whether there is no previous link after the cursor.
Return t if there is no previous link; otherwise, return nil."
  (save-excursion
    (equal (point) (w3m-get-prev-link-start))))

(provide 'w3m-extension)

;;; LocalWords:  lnum utilties linknum unmark uniqure beautify logon login bw
;;; LocalWords:  postfix urbandictionary intitle inurl HaskellWiki's Anhonl txt
;;; LocalWords:  zh TW inlang tabset pos vscroll zerop UTC
