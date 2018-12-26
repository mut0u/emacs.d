(require 'awesome-tray)

(awesome-tray-mode 1)


(require 'awesome-tab)


(global-disable-mouse-mode)


(require 'thing-edit)
(require 'aweshell)
(require 'awesome-tab)
(awesome-tab-mode t)
(light)

(require 'youdao-dictionary)
(global-set-key (kbd "<f8>") 'youdao-dictionary-search-at-point+)


(provide 'init-enhance)
;;;
