
(global-set-key [f11] 'my-fullscreen);F11 全屏

(global-set-key (kbd "C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "C-<right>")  'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>")  'shrink-window)
(global-set-key (kbd "C-<up>")  'enlarge-window)



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




(eval-after-load "lisp-mode"
  '(progn
      ;;(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
    
     (define-key lisp-mode-map (kbd "C-c M-l") 'slime-list-compiler-notes)))

(provide 'init-key)
