;;;
(global-disable-mouse-mode)

;;;(require 'lazycat-theme)

(require 'awesome-tray)
(awesome-tray-mode 1)

(require 'thing-edit)
;;(require 'aweshell)
(require 'awesome-tab)
(awesome-tab-mode t)
(setq awesome-tab-style "bar")

(require 'youdao-dictionary)
(global-set-key (kbd "<f8>") 'youdao-dictionary-search-at-point+)

(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
          'append)

(defun michael-enhance ()
  "I am not sure the tray mode why ..."
  (interactive)
  (awesome-tray-mode t)
  )


(defun eldoc-trigger ()
  (interactive)
  (if global-eldoc-mode
      (progn (global-eldoc-mode -1)
             (remove-hook 'pre-command-hook 'eldoc-pre-command-refresh-echo-area))
    (global-eldoc-mode t)))

(defun eldoc-disable-local ()
  (interactive)
  (setq-local eldoc-documentation-function #'ignore))



(defun wren-add-to-anki ()
  "Add word/definition/sententce to Anki web, assuming moz-controller is running"
  (interactive)
  (let* ((word (thing-at-point 'word t))
         (definition (ido-completing-read "Choose a definition: "
                                          (append (assoc-default 'explains
                                                                 (assoc-default 'basic (youdao-dictionary--request word))) nil)))
         (sentence (replace-regexp-in-string "\"" "'" (replace-regexp-in-string "\n" "" (thing-at-point 'sentence t)))))
    (comint-send-string
     (inferior-moz-process)
     (format "var typeSelect = content.window.document.getElementById('models'); for(var i = 0, j = typeSelect.length; i < j; ++i) { if(typeSelect.options[i].innerHTML === 'EN') { typeSelect.selectedIndex = i; var event = new content.window.UIEvent('change', {'bubbles': true, 'cancelable': true}); typeSelect.dispatchEvent(event); break; } }; content.window.document.getElementById('f0').textContent = '%s'; content.window.document.getElementById('f1').textContent=\"%s\"; content.window.document.getElementById('f2').textContent=\"%s\"; content.window.document.getElementsByClassName('btn-primary')[0].click();" word definition sentence)
     )
    ))


(provide 'init-enhance)
;;; init-enhance.el ends here
