;;; rc-ui.el ---


;; Set color theme
(use-package tango-plus-theme
  :ensure t
  :config (load-theme 'tango-plus t))

;; (use-package github-theme
;;   :ensure t
;;   :config (load-theme 'github t))

;; (use-package hemisu-theme
;;   :ensure t
;;   :config (load-theme 'hemisu-dark t))

;; (use-package hydandata-light-theme
;;   :ensure t
;;   :config (load-theme 'hydandata-light t))

;; (use-package gandalf-theme
;;   :ensure t
;;   :config (load-theme 'gandalf t))

;; Font settings
(case system-type
 ;; ((windows-nt)
 ;;  (progn
 ;;    (set-default-font "Liberation Mono 12"))))
 ((darwin)
  (progn
    (set-default-font "Menlo 14")))
  ((gnu/linux)
   (progn
     (set-default-font "Liberation Mono 12"))))

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable menubar and toolbar
(if window-system
    (tool-bar-mode -1))
(menu-bar-mode -1)

;; Tailor split width threshold for 14"
(setq split-width-threshold 140)

;; Use visual beeper
(setq visible-bell t)

;; Highlight the current line
(global-hl-line-mode t)

;; Set line number spacer for -nw version
(unless window-system
  (defadvice linum-update-window (around linum-dynamic activate)
    (let* ((w (length (number-to-string
                       (count-lines (point-min) (point-max)))))
           (linum-format (concat "%" (number-to-string w) "d ")))
      ad-do-it)))

;; Show row and column numbers in the bar
(line-number-mode t)
(column-number-mode t)

(setq cursor-in-non-selected-windows nil
      use-dialog-box nil)

;; Prompting
(fset 'yes-or-no-p 'y-or-n-p)


;;; rc-ui.el ends here
