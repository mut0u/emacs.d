(require-package 'org)
(require-package 'org-octopress)

(require 'ox-publish)
(require 'org-octopress)


(defconst base-directory "")

(defcustom blog-base-directory "~/org/notes/"
  "base for blog dir"
  :group 'org-blog
  :type 'string)



(defcustom wx-blog-base-directory "~/org/notes/"
  "base for wx-blog dir"
  :group 'org-blog
  :type 'string)


(defcustom blog-publishing-directory "~/org/public_html/"
  "dir for genreate html file come from org file"
  :group 'org-blog
  :type 'string)


(defcustom wx-blog-publishing-directory "~/org/public_html/"
  "dir for genreate html file come from org file"
  :group 'org-blog
  :type 'string)



(defcustom blog-static-directory "~/org/static/"
  "static dir for css and js file"
  :group 'org-blog
  :type 'string)


(defcustom blog-author "unknow"
  "author"
  :group 'org-blog
  :type 'string)


(defcustom blog-email "test@unknow.com"
  "email"
  :group 'org-blog
  :type 'string)




(when (not (file-exists-p blog-base-directory))
  (make-directory blog-base-directory t))

(when (not (file-exists-p blog-publishing-directory))
  (make-directory blog-publishing-directory t))


(setq org-publish-project-alist
      `(
        ;; 把各部分的配置文件写到这里面来
        ("-notes"
         :base-directory  ,blog-base-directory
         :base-extension "org"
         :publishing-directory ,blog-publishing-directory
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         :section-numbers nil
         :author ,blog-author
         :email ,blog-email
         ;;         :auto-sitemap t                ; Generate sitemap.org automagically...
         ;;         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         ;;         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         ;;         :sitemap-sort-files anti-chronologically
         ;;         :sitemap-file-entry-format "%d %t"
         )

        ("-wx-notes"
         :base-directory  ,wx-blog-base-directory
         :base-extension "org"
         :publishing-directory ,wx-blog-publishing-directory
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         :section-numbers nil
         :author ,blog-author
         :email ,blog-email
         ;;         :auto-sitemap t                ; Generate sitemap.org automagically...
         ;;         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         ;;         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         ;;         :sitemap-sort-files anti-chronologically
         ;;         :sitemap-file-entry-format "%d %t"
         )


        ("-static"
         :base-directory ,blog-static-directory
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory ,blog-publishing-directory
         :recursive t
         :publishing-function org-publish-attachment)
        ("blog" :components ("-notes" "-static"))
        ("wx" :components ("-wx-notes"))))



(defun blog-publish ()
  (interactive)
  (org-publish "blog"))


(defun wx-publish ()
  (interactive)
  (org-publish "wx"))


(defun hello1 (name)
  (message  "hello11 %s" name)
  )


(when (maybe-require-package 'org-octopress)
  (setq org-octopress-directory-top       "/home/savior/github.repo/blog/source")
  (setq org-octopress-directory-posts     "/home/savior/github.repo/blog/source/_posts")
  (setq org-octopress-directory-org-top   "/home/savior/github.repo/blog")
  (setq org-octopress-directory-org-posts "/home/savior/github.repo/blog/source/blog")
  (setq org-octopress-setup-file          "/home/savior/github.repo/blog/setupfile.org")
  )







(provide 'init-blog)
