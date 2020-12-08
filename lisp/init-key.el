

;;;-----------------------------------
;;; global key binds
;;;-----------------------------------
;;; Code:
(global-set-key (kbd "C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "C-<right>")  'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>")  'shrink-window)
(global-set-key (kbd "C-<up>")  'enlarge-window)

(define-key global-map [(insert)] nil)

(global-unset-key "\C-h\C-n")    ;;; remove the news of Emacs

(when window-system
  (global-unset-key "\C-z")
  (global-unset-key "\C-x\C-z"))



;;;--------------------------------------------------
;;; Python key binds  it not work and i do not konw why
;;;-------------------------------------------------
;;;(after-load 'python
;;;
;;;     (define-key python-mode-map (kbd "C-c C-b") 'python-add-breakpoint)
;;;     (define-key python-mode-map (kbd "<backspace>")  'paredit-backward-delete))





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
;;(lazy-unset-key '(".") doc-view-mode-map)             ;卸载按键
;;(lazy-unset-key '("x" "M-<" "M->") doc-view-mode-map) ;卸载一些按键

;;;(lazy-set-key
;;; '(
;;;   ("N" . doc-view-next-page)                      ;下一页
;;;   ("P" . doc-view-previous-page)                  ;上一页
;;;   ("." . doc-view-first-page)                     ;第一页
;;;   ("," . doc-view-last-page)                      ;最后一页
;;;   ("g" . doc-view-goto-page)                      ;跳到第几页
;;;   ("e" . doc-view-scroll-down-or-previous-page)   ;向上滚动一屏
;;;   ("SPC" . doc-view-scroll-up-or-next-page)       ;向下滚动一屏
;;;   ("j" . doc-view-next-line-or-next-page)         ;下一行或下一屏
;;;   ("k" . doc-view-previous-line-or-previous-page) ;上一行或上一屏
;;;   ("t" . doc-view-show-tooltip)                   ;当前页提示
;;;   ("q" . bury-buffer)                             ;隐藏buffer
;;;   ("Q" . doc-view-kill-proc-and-buffer)           ;退出并结束进程
;;;   ("C-s" . doc-view-search)                       ;搜索
;;;   ("C-S-n" . doc-view-search-next-match)          ;下一个匹配
;;;   ("C-S-p" . doc-view-search-previous-match)      ;上一个匹配
;;;   ("+" . doc-view-enlarge)                        ;放大页面
;;;   ("-" . doc-view-shrink)                         ;缩小页面
;;;   ("C-c C-c" . doc-view-toggle-display)           ;在文本和图像间切换
;;;   ("C-c C-t" . doc-view-open-text)                ;打开文本
;;;   ("r" . revert-buffer)                           ;刷新
;;;   ("s" . auto-scroll-mode)                        ;自动滚屏
;;;   ("<" . auto-scroll-faster)                      ;加快滚屏速度
;;;   (">" . auto-scroll-slower)                      ;减慢滚屏速度
;;;
;;;   ([remap scroll-up] . doc-view-next-line-or-next-page) ;重新定向按键, 支持 auto-scroll
;;;
;;;   )
;;; doc-view-mode-map
;;; )

;;;--------------------------------------------------------
;;; ### Tabbar ###
;;; --- 多标签浏览
;;;---------------------------------------------------------
;;(lazy-set-key
;; '(
;;   ("M-7" . tabbar-backward-tab)        ;移动到后一个标签
;;   ("M-8" . tabbar-forward-tab)         ;移动到前一个标签
;;   ("M-9" . tabbar-backward-group)      ;移动到后一个标签组
;;   ("M-0" . tabbar-forward-group)       ;移动到前一个标签组
;;   ))
;;(lazy-set-autoload-key
;; '(
;;   ("M-&" . tabbar-backward-tab-other-window) ;向前移动其他窗口的标签
;;   ("M-*" . tabbar-forward-tab-other-window)  ;向后移动其他窗口的标签
;;   ("M-s-7" . tabbar-select-beg-tab)          ;移动到最左边的标签
;;   ("M-s-8" . tabbar-select-end-tab)          ;移动到最右边的标签
;;   )
;; "tabbar-extension")
;;
;;;;(lazy-set-key sdcv-key-alist doc-view-mode-map) ;sdcv的局部按键绑定


;;; ### Awesome-Pair ###
;;; --- 结构化编程
(lazy-unset-key '("M-J" "M-r" "M-s" "M-;" "C-M-f" "C-M-b" "M-)") awesome-pair-mode-map) ;卸载按键
(defvar awesome-pair-key-alist nil)
(setq awesome-pair-key-alist
      '(
        ;; 移动
        ("M-n" . awesome-pair-jump-left)
        ("M-p" . awesome-pair-jump-right)
        ;; 符号插入
        ("%" . awesome-pair-match-paren)       ;括号跳转
        ("(" . awesome-pair-open-round)        ;智能 (
        ("[" . awesome-pair-open-bracket)      ;智能 [
        ("{" . awesome-pair-open-curly)        ;智能 {
        (")" . awesome-pair-close-round)       ;智能 )
        ("]" . awesome-pair-close-bracket)     ;智能 ]
        ("}" . awesome-pair-close-curly)       ;智能 }
        ("\"" . awesome-pair-double-quote)     ;智能 "
        ("=" . awesome-pair-equal)             ;智能 =
        ("SPC" . awesome-pair-space)           ;智能 Space
        ;; 删除
        ("M-o" . awesome-pair-backward-delete) ;向后删除
        ("C-d" . awesome-pair-forward-delete)  ;向前删除
        ("C-k" . awesome-pair-kill)            ;向前kill
        ;; 包围
        ("M-\"" . awesome-pair-wrap-double-quote) ;用 " " 包围对象, 或跳出字符串
        ("M-[" . awesome-pair-wrap-bracket)       ;用 [ ] 包围对象
        ("M-{" . awesome-pair-wrap-curly)         ;用 { } 包围对象
        ("M-(" . awesome-pair-wrap-round)         ;用 ( ) 包围对象
        ("M-)" . awesome-pair-unwrap)             ;去掉包围对象
        ;; 跳出并换行缩进
        ("M-:" . awesome-pair-jump-out-pair-and-newline) ;跳出括号并换行
        ))
(lazy-set-key awesome-pair-key-alist awesome-pair-mode-map)



(require-package 'helm)
(require 'helm)

(defun zilongshanren/helm-hotspots ()
  "helm interface to my hotspots, which includes my locations,
org-files and bookmarks"
  (interactive)
  (helm :buffer "*helm: utities*"
        :sources `(,(zilongshanren//hotspots-sources))))

(defun zilongshanren//hotspots-sources ()
  "Construct the helm sources for my hotspots"
  `((name . "Util")
    (candidates . (("Calendar" . (lambda ()  (browse-url "https://www.google.com/calendar/render")))
                   ("[1] Blog" . org-octopress)
                   ("[2] Calculator" . (lambda () (helm-calcul-expression)))
                   ("Run current flie" . (lambda () (zilongshanren/run-current-file)))
                   ("Agenda" . (lambda () (org-agenda "" "a")))
                   ("[5] org-capture" . (lambda () (org-capture)))
                   ("[6] New Buffer" . (lambda () (new-empty-buffer)))))
    (candidate-number-limit)
    (action . (("Open" . (lambda (x) (funcall x)))))))

(global-set-key (kbd "<f1>") 'zilongshanren/helm-hotspots)
(global-set-key (kbd "<f9>") 'thing-copy-word)



(provide 'init-key)
