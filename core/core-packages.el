;;; core-packages.el ---


;; Add directory with side packages
(add-to-list 'load-path "~/.emacs.d/elcustom")

(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(setq package-user-dir (local-file-name "elpa"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(eval-when-compile
  (require 'use-package))


;;; core-packages.el ends here
