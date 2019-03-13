;;;
(global-disable-mouse-mode)


(require 'thing-edit)
;;(require 'aweshell)
(require 'awesome-tab)
(awesome-tab-mode t)


(require 'youdao-dictionary)
(global-set-key (kbd "<f8>") 'youdao-dictionary-search-at-point+)



(require 'awesome-tray)
(awesome-tray-mode t)


(provide 'init-enhance)
;;;
