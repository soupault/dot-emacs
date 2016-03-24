;;; rc-ui.el ---


;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable menubar and toolbar
(tool-bar-mode -1)
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

;; Set color theme
;; (require 'color-theme-tomorrow)
;; (color-theme-tomorrow--define-theme night)
;; (require 'ample-theme)

(use-package zenburn-theme
  :ensure t
  :init
  :config (load-theme 'zenburn t))


;;; rc-ui.el ends here
