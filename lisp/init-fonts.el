;;; set the font and change the font size

(require 'cl)


(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
      (format "%s %s" font-name font-size)))

(defun qiang-set-font (english-fonts
                       font-size
                       chinese-fonts)
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (let ((en-font (qiang-make-font-string
                  (find-if #'x-list-fonts english-fonts)
                  (format ":pixelsize=%s" font-size)))
        (zh-font-name (find-if #'x-list-fonts chinese-fonts)))
    ;; Set the default English font
    ;;
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
;    (setf font-pair (cons en-font zh-font))
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)
    ;; Set Chinese font
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font-name)
    (dolist (charset ;'(kana han symbol cjk-misc bopomofo)
             '(han))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family zh-font-name)))))


(defvar my/en-font-list '("Source Code Pro Light" "Bitstream Vera Sans Mono"))
(defvar my/font-size "12")
(defvar my/zh-font-list '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "宋体"))

(qiang-set-font  my/en-font-list 12  my/zh-font-list)


(defun sanityinc/increment-default-font-height (delta)
  "Adjust the default font height by DELTA on every frame.
Emacs will keep the pixel size of the frame approximately the
same.  DELTA should be a multiple of 10, to match the units used
by the :height face attribute."
  (let* ((new-height (+ (face-attribute 'default :height) delta))
         (new-point-height (/ new-height 10))
         (fw (frame-width (selected-frame))))
    (dolist (f (frame-list))
      (with-selected-frame f
        ;; Latest 'set-frame-font supports a "frames" arg, but
        ;; we cater to Emacs 23 by looping instead.
        (qiang-set-font my/en-font-list new-point-height my/zh-font-list)))
    (message "default font size is now %d" new-point-height)))

(defun sanityinc/increase-default-font-height ()
  (interactive)
  (sanityinc/increment-default-font-height 10))

(defun sanityinc/decrease-default-font-height ()
  (interactive)
  (sanityinc/increment-default-font-height -10))

(global-set-key (kbd "C-M-=") 'sanityinc/increase-default-font-height)
(global-set-key (kbd "C-M--") 'sanityinc/decrease-default-font-height)


(provide 'init-fonts)
