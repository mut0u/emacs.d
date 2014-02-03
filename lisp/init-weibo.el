;;; Code:

(defun weibo-setting ()
  "settings for weibo"
  (setq weibo-directory "~/.weibo"))

(eval-after-load "weibo"
  '(weibo-setting))

(autoload 'weibo-timeline "weibo" nil t)

(defalias 'weibo 'weibo-timeline)

;;; provide features
(provide 'init-weibo)

;;; init-weibo.el ends here
