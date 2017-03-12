;;; core-packages.el ---


;; Add directory with side packages
(add-to-list 'load-path "~/.emacs.d/elcustom/")

(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/") t)

(if (version< emacs-version "24.4")
    (message "Repo priorities are not supported by the current Emacs version")
  (setq package-archive-priorities
        '(("melpa-stable" . 20)
          ("elpy" . 20)
          ("melpa" . 10))))

(setq package-user-dir (local-file-name "elpa"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)


;;; core-packages.el ends here
