(require-package 'org-mode)

(require 'ox-publish)

(defconst base-directory "/Users/savior/github.respo/mut0u.github.io/notes/")
(defconst publishing-directory "~/github.respo/mut0u.github.io/public_html/")

(setq org-publish-project-alist
      '(
        ;; 把各部分的配置文件写到这里面来
        ("blog-notes"
         :base-directory "~/org/notes"
         :base-extension "org"
         :publishing-directory "~/org/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         :section-numbers nil
         :author "savior"
         :email "michael.savior@gmail.com"
         ;;         :auto-sitemap t                ; Generate sitemap.org automagically...
         ;;         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         ;;         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         ;;         :sitemap-sort-files anti-chronologically
         ;;         :sitemap-file-entry-format "%d %t"
         )

        ("blog-static"
         :base-directory "~/org/notes"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/org/public_html/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("blog" :components ("blog-notes" "blog-static"))))


(provide 'init-blog)
