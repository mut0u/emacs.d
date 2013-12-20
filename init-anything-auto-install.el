
(require-package 'auto-install)
(require-package 'anything)
(require 'auto-install)

(add-to-list 'load-path "~/.emacs.d/auto-install")

(if (not (member 'anything-auto-install package-activated-list))
    (auto-install-from-url "http://www.emacswiki.org/emacs/download/anything-auto-install.el"))



(require 'anything-auto-install)

(provide 'init-anything-auto-install)
