;;;author savior
;;;; this file is used for my configure which need to init first



(require-package 'auto-highlight-symbol)
(require-package 'highlight-tail)
(require-package 'highlight-parentheses)

;;有道词典
(require-package 'youdao-dictionary)

(require-package 'sudo-edit)            ;安装sudo edit.
(show-paren-mode t)                     ;显示括号匹配

;(add-hook 'find-file-hook 'highlight-parentheses-mode t)  ;增强的括号高亮 should only available the C mode
(global-hl-line-mode 1)                                              ;高亮当前行




(provide 'init-base)
