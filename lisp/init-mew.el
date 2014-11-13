(require-package 'mew)
(require-package 'elscreen-mew)

(setq mew-fcc "+sent")
(setq mew-demo-picture nil)
(setq mew-pop-size 0)
;;(setq mew-imap-prefix-list '("#mh/" "#mhinbox"))
(setq mew-auto-get t)
(setq toolbar-mail-reader 'Mew)
(setq mew-use-cached-passwd t)
(setq mew-passwd-timer-unit 999)
(setq mew-passwd-lifetime 999)
(set-default 'mew-decode-quoted 't)
(setq mew-prog-pgp "gpg")
(setq mew-pop-delete nil)
(setq mew-config-alist
      ;;Gmail
      '(("default"
         ("name"		. "gaowei")
         ("user"		. "michael.savior")
         ("mail-domain"	. "gmail.com")
         ("proto"	. "+")
         ("pop-ssl"	. t)
         ("pop-ssl-port"	. "995")
         ("prog-ssl"	. "/usr/sbin/stunnel")
         ("pop-auth"	. pass)
         ("pop-user"	. "michael.savior@gmail.com")
         ("pop-server"	. "pop.gmail.com")
         ("smtp-ssl"	. t)
         ("smtp-ssl-port". "465")
         ("smtp-auth-list" . ("PLAIN" "LOGIN" "CRAM-MD5"))
         ("smtp-user"	. "michael.savior@gmail.com")
         ("smtp-server"	. "smtp.gmail.com")
         )
        ;;;;("IMAP"
        ;;;; ("name"	. "WANG Cong")
        ;;;; ("user"	. "xxxx")
        ;;;; ("mail-domain" . "gmail.com")
        ;;;; ("proto" . "%")
        ;;;; ("imap-server"	. "server address")
        ;;;; ("imap-ssh-server"	. "SSH server address")
        ;;;; ("imap-user"	. "IMAP login name")
        ;;;; ("imap-size"	. 0)
        ;;;; ("smtp-ssl"	. t)
        ;;;; ("smtp-ssl-port". "465")
        ;;;; ("smtp-auth-list" . ("PLAIN" "LOGIN" "CRAM-MD5"))
        ;;;; ("smtp-user"	. "SMTP login name")
        ;;;; ("smtp-server"	. "SMTP server address")
        ;;;; ("imap-delete" . t)
        ;;;; ("imap-queue-folder" . "%queue")
        ;;;; ("imap-trash-folder" . "%INBOX.Trash") ;; This must be in concile with your IMAP box setup
        ;;;; )
        ))
(setq mew-ssl-verify-level 0)
(setq mew-prog-ssl "/usr/sbin/stunnel")

(setq mew-refile-guess-alist
      '(("To:"
         ("xiyoulinux@googlegroups.com" . "+xiyoulinux")
         ("linux-kernel@zh-kernel.org"   . "+zh-kernel")
         ("zeuux-universe@zeuux.org"     . "+zeuux")
         ("linux-kernel@vger.kernel.org" . "+lkml"))
        ("Cc:"
         ("xiyoulinux@googlegroups.com" . "+xiyoulinux")
         ("linux-kernel@zh-kernel.org"   . "+zh-kernel")
         ("zeuux-universe@zeuux.org"     . "+zeuux")
         ("linux-kernel@vger.kernel.org" . "+lkml"))
        (nil . "+inbox")))

;;Biff
(setq mew-use-biff t) ;; nil
(setq mew-use-biff-bell t) ;; nil
(setq mew-pop-biff-interval 10) ;; 5 (minutes)

;;Reply
(setq mew-reply-sender-alist
      '(("Reply-To:"
         ("To:" "Reply-To:" "From:"))
        (t
         ("To:" "From:"))))
(setq mew-reply-all-alist
      '((("Followup-To:" "poster")
         ("To:" "From:"))
        ("Followup-To:"
         ("Newsgroups:" "Followup-To:"))
        ("Newsgroups:"
         ("Newsgroups:" "Newsgroups:"))
        ("Reply-To:"
         ("To:" "Reply-To:"))
        (t
         ("To:" "From:")
         ("Cc:" "To:" "Cc:" "Apparently-To:"))))

;;cite
(setq mew-cite-fields '("From:" "Subject:" "Date:" "Message-ID:"))
(setq mew-cite-format "From: %s\nSubject: %s\nDate: %s\nMessage-ID: %s\n\n")
(setq mew-cite-prefix-function 'mew-cite-prefix-username)

;;signature
(setq mew-signature-file "~/.signature")
(setq mew-signature-insert-last t)

;;Thread
(setq mew-prog-imls-arg-list '("--thread=yes" "--indent=2"))
(setq mew-use-fancy-thread t)
(setq mew-fancy-thread-indent-strings  [" +" " +" " |" "  "] )
(setq mew-use-thread-separator nil)
(setq mew-thread-separator "--")

;;Sort
(setq mew-sort-default-key-alist
      '(("+inbox" . "date")
        ("+xiyoulinux". "subject")
        ("+zh-kernel". "subject")
        ("+zeuux". "subject")
        ("+lkml" . "subject")))

;;Forward
(setq mew-field-delete-for-forwarding '("Received:" "Return-Path:"))



(provide 'init-mew)
