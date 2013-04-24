(require-package 'wget)
(require-package 'w3m)



(defun w3m-setting ()
  "settings for w3m"
  ;; required features
  (require 'wget)
  (require 'w3m-fb)
  ;(require 'org-w3m)
  (require 'w3m-ems)
  (require 'w3m-form)
  (require 'w3m-lnum)
  (require 'w3m-util)
  (require 'w3m-wget)
  (require 'w3m-hist)
  (require 'w3m-image)
  (require 'w3m-cookie)
  (require 'w3m-symbol)
  (require 'w3m-search)
  (require 'w3m-filter)
  (require 'w3m-favicon)
  (require 'w3m-session)
  (require 'w3m-bookmark)
  (require 'w3m-extension)

  ;; functions definition
  (defun w3m-set-proxy (&optional proxy)
    "set proxy for w3m"
    (interactive "sProxy Server:")
    (if (string= proxy "")
        (setenv "http_proxy" nil)
      (if (string-match "^http://" proxy)
          (setenv "http_proxy" proxy)
        (setenv "http_proxy" (concat "http://" proxy)))
      (message "set w3m proxy to %s" (getenv "http_proxy"))))

  (defun w3m-filter-rules-for-google (&rest args)
    "Filter rules for Google in w3m.
remove publicize from google.cn or google.com."
    (goto-char (point-min))
    (while (re-search-forward "\\(赞助商链接\\|<h2>Sponsored Links</h2>\\).*aclk.*\\(</cite></ol><p>\\|在此展示您的广告\\)" nil t)
      (replace-match ""))
    (while (re-search-forward "<h2>Sponsored Links</h2>.*aclk.*<h2>Search Results</h2>" nil t)
      (replace-match "")))

  ;; settings
  (unless (file-exists-p "~/.emacs.d/W3M/DownloadPages/")
    (make-directory "~/.emacs.d/W3M/DownloadPages/" t))
  (setq w3m-cookie-file "~/.emacs.d/W3M/cookie")
  (setq w3m-session-file "~/.emacs.d/W3M/session")
  (setq w3m-bookmark-file "~/.emacs.d/W3M/bookmark.html")
  (setq w3m-home-page "")
  (setq w3m-use-cookies t)
  (setq w3m-make-new-session t)
  (setq w3m-use-header-line-title t)
  (setq w3m-cookie-accept-bad-cookies t)
  (setq browse-url-new-window-flag t)
  (setq w3m-session-time-format "%Y-%m-%d (%a) %H:%M")
  (setq w3m-favicon-use-cache-file t)
  (setq w3m-show-graphic-icons-in-mode-line t)
  (setq w3m-edit-function '(find-file-other-window))
  (setq w3m-session-deleted-save nil)
  (setq w3m-default-display-inline-images t)
  (setq w3m-toggle-inline-images-permanently t)
  (setq w3m-enable-google-feeling-lucky nil)
  (setq w3m-use-filter t)
  (setq w3m-fb-mode t)
  (setq w3m-session-load-crashed-sessions t)
  (add-hook 'w3m-display-hook
            (lambda (url)
              (rename-buffer
               (format "*w3m: %s*"
                       (beautify-string (or w3m-current-title
                                            w3m-current-url) 50)) t)))
  (add-to-list 'w3m-filter-rules
               '("\\`http://www\\.google\\.\\(cn\\|com\\)/"
                 w3m-filter-rules-for-google))
  (w3m-fb-mode 1)

  ;; key bindings
  (lazy-set-key
   '(("1" . w3m-session-save)
     ("2" . w3m-session-select)
     ("3" . w3m-search-dict-cn)
     ("4" . w3m-search-google-web-en)
     ("s" . w3m-search-google-web-en)
     ("S" . w3m-search-google-web-cn)
     ("5" . w3m-search-emacswiki)
     ("0" . emms-play-online)
     ("b" . w3m-previous-form)
     ("f" . w3m-next-form)
     ("B" . w3m-previous-anchor)
     ("<tab>" . w3m-next-anchor)
     ("e" . w3m-edit-current-url)
     ("+" . w3m-zoom-in-image)
     ("-" . w3m-zoom-out-image)
     ("n" . scroll-up)
     ("p" . scroll-down)
     ("H" . w3m-history)
     ("h" . w3m-db-history)
     ("D" . w3m-dtree)
     ("P" . w3m-view-previous-page)
     ("<backspace>" . w3m-view-previous-page)
     ("F" . w3m-view-next-page)
     ("c" . w3m-delete-buffer-and-select)
     ("C" . w3m-delete-other-buffers)
     ("d" . w3m-wget)
     ("o" . w3m-lnum-goto)
     ("O" . org-w3m-copy-for-org-mode)
     ("l" . w3m-copy-link-in-region)
     ("<" . w3m-shift-left)
     (">" . w3m-shift-right)
     ("<down>" . scroll-up)
     ("<up>" . scroll-down)
     ("M-n" . w3m-next-buffer)
     ("M-p" . w3m-previous-buffer)
     ("<f5>" . w3m-reload-this-page)
     ("M-<f5>" . w3m-reload-all-pages)
     ("<f12>" . w3m-next-buffer)
     ("C-<f12>" . w3m-previous-buffer))
   w3m-mode-map))

(eval-after-load "w3m"
  '(w3m-setting))

(autoload 'w3m-browse-url "w3m" "Ask emacs-w3m to browse URL" t)
(autoload 'toggle-w3m-with-other-buffer "w3m-extension"
  "switch w3m and current buffer smoothly" t)
(autoload 'w3m-search-google-web-en "w3m-extension"
  "search google web en")

;; global set browse url function


 (setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)

 ;(global-set-key "\C-xm" 'browse-url-at-point)

(lazy-set-key
 '(("C-x C-z" . toggle-w3m-with-other-buffer)
   ("<f8>" . w3m-search-google-web-en)))

;;; provide features





;;(if (eq window-system 'w32)
;;(setq w3m-content-type-alist
;;      '(("text/plain" "\\.\\(txt\\|tex\\|el\\)" nil)
;;                ("text/html" "\\.s?html?$" w32-shellex-on-object file)
;;                ("image/jpeg" "\\.jpe?g$"  w32-shellex-on-object file)
;;                ("image/png" "\\.png$"     w32-shellex-on-object file)
;;                ("image/gif" "\\.gif$"     w32-shellex-on-object file)
;;                ("image/tiff" "\\.tif?f$"  w32-shellex-on-object file)
;;                ("image/x-xwd" "\\.xwd$"   w32-shellex-on-object file)
;;                ("image/x-xbm" "\\.xbm$"   w32-shellex-on-object file)
;;                ("image/x-xpm" "\\.xpm$"   w32-shellex-on-object file)
;;                ("image/x-bmp" "\\.bmp$"   w32-shellex-on-object file)
;;                ("video/mpeg" "\\.mpe?g$"  w32-shellex-on-object file)
;;                ("video/quicktime" "\\.mov$" w32-shellex-on-object file file)
;;                ("application/postscript" "\\.\\(ps\\|eps\\)$" 
;;w32-shellex-on-object file)
;;                ("application/pdf" "\\.pdf$" w32-shellex-on-object file))
;;          ))
;;








(provide 'init-w3m)

;;; init-w3m.el ends here
