;;;
(require 'awesome-tray)
(awesome-tray-mode 1)


(global-disable-mouse-mode)


(require 'thing-edit)
;;(require 'aweshell)
(require 'awesome-tab)
(awesome-tab-mode t)


(require 'youdao-dictionary)
(global-set-key (kbd "<f8>") 'youdao-dictionary-search-at-point+)


(provide 'init-enhance)
;;;
