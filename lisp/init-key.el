



;;;-----------------------------------
;;; global key binds
;;;-----------------------------------
(global-set-key [f11] 'my-fullscreen);F11 全屏

(global-set-key (kbd "C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "C-<right>")  'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>")  'shrink-window)
(global-set-key (kbd "C-<up>")  'enlarge-window)

;;;----------------------------------------
;;; w3m key binds
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

(after-load 'doc-view-mode
  (define-key doc-view-mode-map (kdb ".") nil)   ;卸载按键
  (define-key doc-view-mode-map (kdb "x") nil)   ;卸载按键
  (define-key doc-view-mode-map (kdb "M-<") nil) ;卸载按键
  (define-key doc-view-mode-map (kdb "M->") nil) ;卸载按键


  (define-key doc-view-mode-map  (kdb "N") 'doc-view-next-page) ;下一页
  (define-key doc-view-mode-map  (kdb "P") 'doc-view-previous-page) ;上一页
  (define-key doc-view-mode-map  (kdb ".") 'doc-view-first-page) ;第一页
  (define-key doc-view-mode-map  (kdb ",") 'doc-view-last-page) ;最后一页
  (define-key doc-view-mode-map  (kdb "g") 'doc-view-goto-page) ;跳到第几页
  (define-key doc-view-mode-map  (kdb "e") 'doc-view-scroll-down-or-previous-page) ;向上滚动一屏
  (define-key doc-view-mode-map  (kdb "SPC") 'doc-view-scroll-up-or-next-page) ;向下滚动一屏
  (define-key doc-view-mode-map  (kdb "j") 'doc-view-next-line-or-next-page) ;下一行或下一屏
  (define-key doc-view-mode-map  (kdb "k") 'doc-view-previous-line-or-previous-page) ;上一行或上一屏
  (define-key doc-view-mode-map  (kdb "t") 'doc-view-show-tooltip) ;当前页提示
  (define-key doc-view-mode-map  (kdb "q") 'bury-buffer) ;隐藏buffer
  (define-key doc-view-mode-map  (kdb "Q") 'doc-view-kill-proc-and-buffer) ;退出并结束进程
  (define-key doc-view-mode-map  (kdb "C-s") 'doc-view-search) ;搜索
  (define-key doc-view-mode-map  (kdb "C-S-n") 'doc-view-search-next-match) ;下一个匹配
  (define-key doc-view-mode-map  (kdb "C-S-p") 'doc-view-search-previous-match) ;上一个匹配
  (define-key doc-view-mode-map  (kdb "+") 'doc-view-enlarge) ;放大页面
  (define-key doc-view-mode-map  (kdb "-") 'doc-view-shrink) ;缩小页面
  (define-key doc-view-mode-map  (kdb "C-c C-c") 'doc-view-toggle-display) ;在文本和图像间切换
  (define-key doc-view-mode-map  (kdb "C-c C-t") 'doc-view-open-text) ;打开文本
  (define-key doc-view-mode-map  (kdb "r") 'revert-buffer)     ;刷新
  (define-key doc-view-mode-map  (kdb "s") 'auto-scroll-mode) ;自动滚屏
  (define-key doc-view-mode-map  (kdb "<") 'auto-scroll-faster) ;加快滚屏速度
  (define-key doc-view-mode-map  (kdb ">") 'auto-scroll-slower) ;减慢滚屏速度

  (define-key doc-view-mode-map  [remap scroll-up]  'doc-view-next-line-or-next-page ) ;重新定向按键, 支持 auto-scroll

  )



;;(lazy-set-key sdcv-key-alist doc-view-mode-map) ;sdcv的局部按键绑定


(provide 'init-key)