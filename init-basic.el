

;;; Code:


(require-package 'ffap)
(require-package 'recentf)
;(require-package 'uniquify)
(require-package 'saveplace)
(require-package 'thingatpt)
(require-package 'ansi-color)

(defun get-mode-name ()
  "display `major-mode' and `mode-name'"
  (interactive)
  (message "major-mode: %s, mode-name: %s"
           major-mode mode-name))

(defun kill-buffer-when-shell-command-exit ()
  "Close current buffer when `shell-command' exit."
  (let ((process (ignore-errors (get-buffer-process (current-buffer)))))
    (when process
      (set-process-sentinel
       process
       (lambda (proc change)
         (when (string-match "\\(finished\\|exited\\)" change)
           (kill-buffer (process-buffer proc))))))))

(defun get-current-word ()
  "Get word under curosr."
  (let ((begin (point-min))
        (end (point-max)))
    (save-excursion
      (when (not mark-active)
        (forward-char)
        (backward-word)
        (mark-word))
      (setq begin (region-beginning)
            end (region-end)))
    (buffer-substring-no-properties begin end)))

(defun mark-whole-sexp ()
  "Mark whole sexp."
  (interactive)
  (let ((region (bounds-of-thing-at-point 'sexp)))
    (if (not region)
        (message "Can not found sexp.")
      (goto-char (car region))
      (call-interactively 'set-mark-command)
      (forward-sexp))))

(defun lisp-mark-function ()
  "Lisp mark function"
  (interactive)
  (mark-defun)
  (let (next-is-fun)
    (save-excursion
      (forward-line)
      (setq next-is-fun (looking-at "[ \t]*(defun")))
    (if (or (looking-at "$")
            (and next-is-fun (not (looking-at "[ \t]*(defun"))))
        (forward-line))))

(defun mark-function ()
  "Mark function."
  (interactive)
  (cond
   ((or (equal major-mode 'c-mode)
        (equal major-mode 'c++-mode))
    (c-mark-function))
   ((or (equal major-mode 'emacs-lisp-mode)
        (equal major-mode 'lisp-mode)
        (equal major-mode 'lisp-interaction-mode))
    (lisp-mark-function))))

(defun comment ()
  "If mark is active comment region, else comment
current line"
  (interactive)
  (if mark-active
      (comment-region (region-beginning) (region-end))
    (comment-region (line-beginning-position) (line-end-position))))

(defun uncomment ()
  "If region is active, uncomment region else uncomment
current line"
  (interactive)
  (if mark-active
      (uncomment-region (region-beginning) (region-end))
    (let (fun)
      (setq fun 'uncomment-region)
      (funcall fun (line-beginning-position) (line-end-position)))))

(defun comment-function ()
  "Comment function."
  (interactive)
  (save-excursion
    (mark-function)
    (comment-region (region-beginning) (region-end))))

(defun copy-cur-line ()
  "Copy current line"
  (interactive)
  (let ((end (min (point-max) (line-end-position))))
    (copy-region-as-kill (line-beginning-position) end)))

(defun copy-region ()
  "Copy region"
  (interactive)
  (copy-region-as-kill (region-beginning) (region-end)))

(defun smart-copy ()
  "Smart copy, if mark is active then copy
region else copy current line"
  (interactive)
  (save-excursion
    (if mark-active
        (call-interactively 'copy-region)
      (call-interactively 'copy-cur-line))))

(defun copy-sexp ()
  "Copy symbol expression"
  (interactive)
  (save-excursion
    (mark-whole-sexp)
    (copy-region-as-kill (region-beginning) (region-end))))

(defun insert-cur-line ()
  "Copy current line and paste it to buffer"
  (interactive)
  (copy-cur-line)
  (forward-line)
  (beginning-of-line)
  (call-interactively 'yank)
  (previous-line)
  (end-of-line))

(defun insert-cur-sexp ()
  "Copy current sexp and paste it to buffer"
  (interactive)
  (copy-sexp)
  (call-interactively 'yank))

(defun smart-kill ()
  "If `mark-active', call `kill-region', otherwise call `kill-whole-line'."
  (interactive)
  (if mark-active
      (call-interactively 'kill-region)
    (call-interactively 'kill-whole-line)))

(defun indent-buffer ()
  "Automatic format current buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)
    (delete-trailing-whitespace)
    (untabify (point-min) (point-max))))

(defun smart-indent ()
  "If `mark-active', call `indent-region', otherwise indent all buffer."
  (interactive)
  (save-excursion
    (if mark-active
        (call-interactively 'indent-region)
      (call-interactively 'indent-buffer))))

(defun unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the inverse of `fill-paragraph'."
  (interactive)
  (let ((fill-column most-positive-fixnum))
    (fill-paragraph nil)))

(defun unfill-region (start end)
  "Replace newline chars in region from START to END by single spaces.
This command does the inverse of `fill-region'."
  (interactive "r")
  (let ((fill-column most-positive-fixnum))
    (fill-region start end)))

(defun dir-file-ext (file)
  "Given a full file's path name, returns a list of directory, filename
and extension.  The extension contains the ., and the directory
contains the /, See also file-name-directory and file-name-nondirectory.."
  (interactive "sString: ")
  (with-temp-buffer
    (insert file)
    (goto-char (point-max))
    (let ((aa (progn
                (goto-char (point-max))
                (search-backward "/" nil t)))
          (bb (progn
                (goto-char (point-max))
                (search-backward "." nil t))))
      (setq aa (if (null aa) (point-min) (+ aa 1)))
      (if (null bb) (setq bb (point-max)))
      (if (> aa bb) (setq bb (point-max)))
      (let ((cc (list (buffer-substring (point-min) aa)
                      (buffer-substring aa bb)
                      (buffer-substring bb (point-max)))))
        (if (interactive-p) (message "%S" cc))
        cc))))

(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun string-all-matches (regex str &optional group)
  "Find all matches for `REGEX' within `STR', returning the full match string or group `GROUP'."
  (let ((result nil)
        (pos 0)
        (group (or group 0)))
    (while (string-match regex str pos)
      (push (match-string group str) result)
      (setq pos (match-end group)))
    result))

(defun string-rtrim (str)
  "Remove trailing whitespace from `STR'."
  (replace-regexp-in-string "[ \t\n]*$" "" str))

(autoload 'find-library-name "find-func")
(defun directory-of-library (library-name)
  "Return the directory in which the `LIBRARY-NAME' load file is found."
  (file-name-as-directory (file-name-directory (find-library-name library-name))))

(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (rename-file filename new-name 1)
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)))))

(defun adjust-opacity (frame incr)
  (let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
         (newalpha (+ incr oldalpha)))
    (when (and (<= frame-alpha-lower-limit newalpha) (>= 100 newalpha))
      (modify-frame-parameters frame (list (cons 'alpha newalpha))))))

;; Provide a version of Emacs 24's 'string-prefix-p in older emacsen
(unless (fboundp 'string-prefix-p)
  (defun string-prefix-p (str1 str2 &optional ignore-case)
    "Return non-nil if STR1 is a prefix of STR2.
If IGNORE-CASE is non-nil, the comparison is done without paying attention
to case differences."
    (eq t (compare-strings str1 nil nil
                           str2 0 (length str1) ignore-case))))

(defun lazy-set-key (key-alist &optional keymap key-prefix)
  "This function is to little type when define key binding.
`KEYMAP' is a add keymap for some binding, default is `current-global-map'.
`KEY-ALIST' is a alist contain main-key and command.
`KEY-PREFIX' is a add prefix for some binding, default is nil."
  (let (key def)
    (or keymap (setq keymap (current-global-map)))
    (if key-prefix
        (setq key-prefix (concat key-prefix " "))
      (setq key-prefix ""))
    (dolist (element key-alist)
      (setq key (car element))
      (setq def (cdr element))
      (cond ((stringp key) (setq key (read-kbd-macro (concat key-prefix key))))
            ((vectorp key) nil)
            (t (signal 'wrong-type-argument (list 'array key))))
      (define-key keymap key def))))

(defun lazy-unset-key (key-list &optional keymap)
  "This function is to little type when unset key binding.
`KEYMAP' is add keymap for some binding, default is `current-global-map'
`KEY-LIST' is list contain key."
  (let (key)
    (or keymap (setq keymap (current-global-map)))
    (dolist (key key-list)
      (cond ((stringp key) (setq key (read-kbd-macro (concat key))))
            ((vectorp key) nil)
            (t (signal 'wrong-type-argument (list 'array key))))
      (define-key keymap key nil))))




 ;;(setq display-time-day-and-date t
 ;;              display-time-24hr-format t)
 ;;           (display-time)


(setq display-time-string-forms
      '(24-hours ":" minutes " ")
       display-time-interval 30)

;; display the time
(display-time-mode 1)
;;prevent backup the all files
(setq make-backup-files nil)

;;; provide features
(provide 'init-basic)

;;; LzyBasic.el ends here
