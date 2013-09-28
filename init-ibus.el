(require 'ibus)
;;;;;apt-get install python-xlib it is important
(setq ibus-agent-file-name "/home/savior/.emacs.d/ibus-el-agent")

;;(add-hook 'after-init-hook 'ibus-mode-on)



;; Use C-SPC for Set Mark command
(ibus-define-common-key ?\C-\s nil)



;; Use C-/ for Undo command
(ibus-define-common-key ?\C-/ nil)



;; Change cursor color depending on IBus status
(setq ibus-cursor-color '("red" "blue" "limegreen"))


(global-set-key (kbd "S-SPC") 'ibus-toggle)

(global-set-key [(control f12)] 'ibus-mode)




(provide 'init-ibus)
