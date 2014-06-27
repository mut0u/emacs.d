



;;;-----------------------------------
;;; global key binds
;;;-----------------------------------
(global-set-key [f11] 'my-fullscreen);F11 全屏

(global-set-key (kbd "C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "C-<right>")  'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>")  'shrink-window)
(global-set-key (kbd "C-<up>")  'enlarge-window)



(global-unset-key "\C-h\C-n")    ;;; remove the news of Emacs

(when window-system
  (global-unset-key "\C-z")
  (global-unset-key "\C-x\C-z"))



;;;--------------------------------------------------
;;; Python key binds  it not work and i do not konw why
;;;-------------------------------------------------
(after-load 'python

     (define-key python-mode-map (kbd "C-c C-b") 'python-add-breakpoint)
     (define-key python-mode-map (kbd "<backspace>")  'paredit-backward-delete))






;;;----------------------------------------
;;; w3m key binds
;;; I do not know why i change the binds to lazy-set will get error.
;;;----------------------------------------

(after-load 'w3m
   (define-key w3m-mode-map (kbd "1")  'w3m-session-save)
   (define-key w3m-mode-map (kbd "2")  'w3m-session-select)
   (define-key w3m-mode-map (kbd "3") 'w3m-search-dict-youdao)
   (define-key w3m-mode-map (kbd "4") 'w3m-search-google-web-en)
   (define-key w3m-mode-map (kbd "s") 'w3m-search-google-web-en)
   (define-key w3m-mode-map (kbd "S") 'w3m-search-google-web-cn)
   (define-key w3m-mode-map (kbd "5") 'w3m-search-emacswiki)
   (define-key w3m-mode-map (kbd "6") 'w3m-search-dict-cn)
   (define-key w3m-mode-map (kbd "0") 'emms-play-online)
   (define-key w3m-mode-map (kbd "b") 'w3m-previous-form)
   (define-key w3m-mode-map (kbd "f") 'w3m-next-form)
   (define-key w3m-mode-map (kbd "B") 'w3m-previous-anchor)
   (define-key w3m-mode-map (kbd "<tab>") 'w3m-next-anchor)
   (define-key w3m-mode-map (kbd "e") 'w3m-edit-current-url)
   (define-key w3m-mode-map (kbd "+") 'w3m-zoom-in-image)
   (define-key w3m-mode-map (kbd "-") 'w3m-zoom-out-image)
   (define-key w3m-mode-map (kbd "n") 'scroll-up)
   (define-key w3m-mode-map (kbd "p") 'scroll-down)
   (define-key w3m-mode-map (kbd "H") 'w3m-history)
   (define-key w3m-mode-map (kbd "h") 'w3m-db-history)
   (define-key w3m-mode-map (kbd "D") 'w3m-dtree)
   (define-key w3m-mode-map (kbd "P") 'w3m-view-previous-page)
   (define-key w3m-mode-map (kbd "<backspace>") 'w3m-view-previous-page)
   (define-key w3m-mode-map (kbd "F") 'w3m-view-next-page)
   (define-key w3m-mode-map (kbd "c") 'w3m-delete-buffer-and-select)
   (define-key w3m-mode-map (kbd "C") 'w3m-delete-other-buffers)
   (define-key w3m-mode-map (kbd "d") 'w3m-wget)
   (define-key w3m-mode-map (kbd "o") 'w3m-lnum-goto)
   (define-key w3m-mode-map (kbd "O") 'rg-w3m-copy-for-org-mode)
   (define-key w3m-mode-map (kbd "l") 'w3m-copy-link-in-region)
   (define-key w3m-mode-map (kbd "<") 'w3m-shift-left)
   (define-key w3m-mode-map (kbd ">") 'w3m-shift-right)
   (define-key w3m-mode-map (kbd "<down>") 'scroll-up)
   (define-key w3m-mode-map (kbd "<up>") 'scroll-down)
   (define-key w3m-mode-map (kbd "M-n") 'w3m-next-buffer)
   (define-key w3m-mode-map (kbd "M-p") 'w3m-previous-buffer)
   (define-key w3m-mode-map (kbd "<f5>") 'w3m-reload-this-page)
   (define-key w3m-mode-map (kbd "M-<f5>") 'w3m-reload-all-pages)
   (define-key w3m-mode-map (kbd "<f12>") 'w3m-next-buffer)
   (define-key w3m-mode-map (kbd "C-<f12>") 'w3m-previous-buffer)
   (define-key w3m-mode-map (kbd "C-x C-z" ) 'toggle-w3m-with-other-buffer)
   (define-key w3m-mode-map (kbd "<f8>" )  'w3m-search-google-web-en))




;;;---------------------------------------------------
;;; common lisp key binds
;;;----------------------------------------------------

(eval-after-load "lisp-mode"
  '(progn
      ;;(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
     (define-key lisp-mode-map (kbd "C-c M-l") 'slime-list-compiler-notes)))





;;;------------------------------------------------------
;;; doc-view key binds
;;;------------------------------------------------------
(lazy-unset-key '(".") doc-view-mode-map)             ;卸载按键
(lazy-unset-key '("x" "M-<" "M->") doc-view-mode-map) ;卸载一些按键

(lazy-set-key
 '(
   ("N" . doc-view-next-page)                      ;下一页
   ("P" . doc-view-previous-page)                  ;上一页
   ("." . doc-view-first-page)                     ;第一页
   ("," . doc-view-last-page)                      ;最后一页
   ("g" . doc-view-goto-page)                      ;跳到第几页
   ("e" . doc-view-scroll-down-or-previous-page)   ;向上滚动一屏
   ("SPC" . doc-view-scroll-up-or-next-page)       ;向下滚动一屏
   ("j" . doc-view-next-line-or-next-page)         ;下一行或下一屏
   ("k" . doc-view-previous-line-or-previous-page) ;上一行或上一屏
   ("t" . doc-view-show-tooltip)                   ;当前页提示
   ("q" . bury-buffer)                             ;隐藏buffer
   ("Q" . doc-view-kill-proc-and-buffer)           ;退出并结束进程
   ("C-s" . doc-view-search)                       ;搜索
   ("C-S-n" . doc-view-search-next-match)          ;下一个匹配
   ("C-S-p" . doc-view-search-previous-match)      ;上一个匹配
   ("+" . doc-view-enlarge)                        ;放大页面
   ("-" . doc-view-shrink)                         ;缩小页面
   ("C-c C-c" . doc-view-toggle-display)           ;在文本和图像间切换
   ("C-c C-t" . doc-view-open-text)                ;打开文本
   ("r" . revert-buffer)                           ;刷新
   ("s" . auto-scroll-mode)                        ;自动滚屏
   ("<" . auto-scroll-faster)                      ;加快滚屏速度
   (">" . auto-scroll-slower)                      ;减慢滚屏速度

   ([remap scroll-up] . doc-view-next-line-or-next-page) ;重新定向按键, 支持 auto-scroll

   )
 doc-view-mode-map
 )

;;;--------------------------------------------------------
;;; ### Tabbar ###
;;; --- 多标签浏览
;;;---------------------------------------------------------
(lazy-set-key
 '(
   ("M-7" . tabbar-backward-tab)        ;移动到后一个标签
   ("M-8" . tabbar-forward-tab)         ;移动到前一个标签
   ("M-9" . tabbar-backward-group)      ;移动到后一个标签组
   ("M-0" . tabbar-forward-group)       ;移动到前一个标签组
   ))
(lazy-set-autoload-key
 '(
   ("M-&" . tabbar-backward-tab-other-window) ;向前移动其他窗口的标签
   ("M-*" . tabbar-forward-tab-other-window)  ;向后移动其他窗口的标签
   ("M-s-7" . tabbar-select-beg-tab)          ;移动到最左边的标签
   ("M-s-8" . tabbar-select-end-tab)          ;移动到最右边的标签
   )
 "tabbar-extension")

;;(lazy-set-key sdcv-key-alist doc-view-mode-map) ;sdcv的局部按键绑定






;;; ### Paredit ###
;;; --- 结构化编程
;;;;;;;;;;;;;;;(lazy-unset-key
;;;;;;;;;;;;;;; '("M-J" "M-r" "M-s" "M-;" "C-M-f" "C-M-b" "M-)")
;;;;;;;;;;;;;;; paredit-mode-map)                      ;卸载按键
;;;;;;;;;;;;;;;(defvar paredit-key-alist nil)
;;;;;;;;;;;;;;;(setq paredit-key-alist
;;;;;;;;;;;;;;;      '(
;;;;;;;;;;;;;;;        ;; 符号插入
;;;;;;;;;;;;;;;        ("(" . paredit-open-parenthesis)           ;智能 (
;;;;;;;;;;;;;;;        (")" . paredit-close-parenthesis)          ;智能 )
;;;;;;;;;;;;;;;        ("[" . paredit-open-bracket)               ;智能 [
;;;;;;;;;;;;;;;        ("]" . paredit-close-bracket)              ;智能 ]
;;;;;;;;;;;;;;;        ("{" . paredit-open-curly)                 ;智能 {
;;;;;;;;;;;;;;;        ("}" . paredit-close-curly)                ;智能 }
;;;;;;;;;;;;;;;        ("C-s-," . paredit-open-angled)            ;智能 <
;;;;;;;;;;;;;;;        ("C-s-." . paredit-close-angled)           ;智能 >
;;;;;;;;;;;;;;;        ("\"" . paredit-doublequote)               ;智能 "
;;;;;;;;;;;;;;;        ("\\" . paredit-backslash)                 ;智能 \
;;;;;;;;;;;;;;;        ;; 删除
;;;;;;;;;;;;;;;        ("M-o" . paredit-backward-delete)          ;向后删除
;;;;;;;;;;;;;;;        ("C-d" . paredit-forward-delete)           ;向前删除
;;;;;;;;;;;;;;;        ("C-M-m" . paredit-forward-kill-word)      ;向前按词删除
;;;;;;;;;;;;;;;        ("C-M-n" . paredit-backward-kill-word)     ;向后按词删除
;;;;;;;;;;;;;;;        ;; 移动
;;;;;;;;;;;;;;;        ("C-M-S-m" . paredit-forward)              ;向前移动
;;;;;;;;;;;;;;;        ("C-M-S-n" . paredit-backward)             ;向后移动
;;;;;;;;;;;;;;;        ;; 包围
;;;;;;;;;;;;;;;        ("M-\"" . paredit-meta-doublequote)        ;用 " " 包围对象, 或跳出字符串
;;;;;;;;;;;;;;;        ("M-[" . paredit-wrap-square)              ;用 [ ] 包围对象
;;;;;;;;;;;;;;;        ("M-{" . paredit-wrap-curly)               ;用 { } 包围对象
;;;;;;;;;;;;;;;        ("C-(" . paredit-wrap-angled)              ;用 < > 包围对象
;;;;;;;;;;;;;;;        ;; 跳出并换行缩进
;;;;;;;;;;;;;;;        ("M-}" . paredit-close-curly-and-newline)  ;跳出 { } 并换行
;;;;;;;;;;;;;;;        ("M-]" . paredit-close-square-and-newline) ;跳出 [ ] 并换行
;;;;;;;;;;;;;;;        ("C-)" . paredit-close-angled-and-newline) ;跳出 < > 并换行
;;;;;;;;;;;;;;;        ;; 其他
;;;;;;;;;;;;;;;        ("C-j" . paredit-newline)          ;智能换行并缩进
;;;;;;;;;;;;;;;        ("M-q" . paredit-reindent-defun)   ;重新格式化函数
;;;;;;;;;;;;;;;        ("M-s-r" . paredit-raise-sexp)     ;提取表达式, 并删除同一等级的其他表达式
;;;;;;;;;;;;;;;        ("M-s-b" . paredit-convolute-sexp) ;嵌套表达式
;;;;;;;;;;;;;;;        ("M-s-'" . one-key-menu-paredit)   ;Paredit 菜单
;;;;;;;;;;;;;;;        ))
;;;;;;;;;;;;;;;(lazy-set-key paredit-key-alist paredit-mode-map)
;;;;;;;;;;;;;;;(lazy-set-mode-autoload-key
;;;;;;;;;;;;;;; '(
;;;;;;;;;;;;;;;   ("C-k" . paredit-kill+))             ;增强的 paredit-kill
;;;;;;;;;;;;;;; paredit-mode-map nil "paredit-extension")
;;;;;;;;;;;;;;;(lazy-set-autoload-key
;;;;;;;;;;;;;;; '(
;;;;;;;;;;;;;;;   ("C-M-:" . paredit-comment-list-and-newline) ;注释当前LIST并换行
;;;;;;;;;;;;;;;   ("M-:" . paredit-close-round-and-newline+)   ;跳出 ( ) 或 " " 并换行
;;;;;;;;;;;;;;;   ("M-?" . paredit-forward-sexp-and-newline)   ;移动到下一个表达式, 并换行
;;;;;;;;;;;;;;;   ("M-(" . paredit-wrap-sexp)                  ;用 ( ) 包围当前对象
;;;;;;;;;;;;;;;   ("M-)" . paredit-splice-sexp+)               ;去除包围对象的括号, 并删除空行
;;;;;;;;;;;;;;;   ("C-S-k" . paredit-duplicate-closest-sexp)   ;复制光标处的语法块
;;;;;;;;;;;;;;;   )
;;;;;;;;;;;;;;; "paredit-extension")




(provide 'init-key)
