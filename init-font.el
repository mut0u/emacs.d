;;(require 'cl)


;;(set-frame-font "Bitstream Vera Sans Mono-12")
;;;;;(set-fontset-font "fontset-default" 'han '("Microsoft YaHei" . "unicode-bmp")


(defun font-name-replace-size (font-name new-size)
  (let ((parts (split-string font-name "-")))
    (setcar (nthcdr 7 parts) (format "%d" new-size))
    (mapconcat 'identity parts "-")))

(defun increment-default-font-height (delta)
  "Adjust the default font height by DELTA on every frame.
The pixel size of the frame is kept (approximately) the same.
DELTA should be a multiple of 10, in the units used by the
:height face attribute."
  (let* ((new-height (+ (face-attribute 'default :height) delta))
         (new-point-height (/ new-height 10)))
    (dolist (f (frame-list))
      (with-selected-frame f
        ;; Latest 'set-frame-font supports a "frames" arg, but
        ;; we cater to Emacs 23 by looping instead.
        (set-frame-font (font-name-replace-size (face-font 'default)
                                                new-point-height)
                        t)))
    (set-face-attribute 'default nil :height new-height)
    (message "default font size is now %d" new-point-height)))

(defun increase-default-font-height ()
  (interactive)
  (increment-default-font-height 10))

(defun decrease-default-font-height ()
  (interactive)
  (increment-default-font-height -10))


;;;改变字体的效果不好，暂时不使用
;;(global-set-key (kbd "C-M-=") 'increase-default-font-height)
;;(global-set-key (kbd "C-M--") 'decrease-default-font-height)


(provide 'init-font)



;;;;;;;;;;;;;;;;;;---
;;Emacs 会优先选用 Consolas + “雅黑”的组合。如果“雅黑”没有装的话，就
;;使用“文泉驿等宽微米黑”，依此类推。这份字体配置不用改动就能在不同的操作系统字体
;;环境下面使用，相信应该没有其它编辑器有这么变态的后备字体列表设置了吧。


(defun qiang-font-existsp (font)
(if (null (x-list-fonts font))
nil t))


(defvar font-list '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "宋体"))
(require 'cl) ;; find-if is in common list package
(find-if #'qiang-font-existsp font-list)

(defun qiang-make-font-string (font-name font-size)
(if (and (stringp font-size)
(equal ":" (string (elt font-size 0))))
(format "%s%s" font-name font-size)
(format "%s %s" font-name font-size)))

(defun qiang-set-font (english-fonts
english-font-size
chinese-fonts
&optional chinese-font-size)
"english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
(require 'cl) ; for find if
(let ((en-font (qiang-make-font-string
(find-if #'qiang-font-existsp english-fonts)
english-font-size))
(zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
:size chinese-font-size)))


;; Set the default English font
;;
;; The following 2 method cannot make the font settig work in new frames.
;; (set-default-font "Consolas:pixelsize=18")
;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
;; We have to use set-face-attribute
(message "Set English Font to %s" en-font)
(set-face-attribute
'default nil :font en-font)


;; Set Chinese font
;; Do not use 'unicode charset, it will cause the english font setting invalid
(message "Set Chinese Font to %s" zh-font)
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
zh-font))))

(qiang-set-font
'("Bitstream Vera Sans Mono") ":pixelsize=16"
'("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "宋体"))
