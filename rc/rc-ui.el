;;; rc-ui.el ---


(tool-bar-mode -1)
(menu-bar-mode -1)

;; Highlight paired parenthesis
(show-paren-mode t)

;; Tailor split width threshold for 14"
(setq split-width-threshold 140)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Mode line settings

;; Show line number for all modes
;; (global-linum-mode t)
;; Set spacer for -nw version
(unless window-system
  (defadvice linum-update-window (around linum-dynamic activate)
    (let* ((w (length (number-to-string
                       (count-lines (point-min) (point-max)))))
           (linum-format (concat "%" (number-to-string w) "d ")))
      ad-do-it)))

(line-number-mode t)
(column-number-mode t)


(setq cursor-in-non-selected-windows nil
      use-dialog-box nil)

;; Prompting
(fset 'yes-or-no-p 'y-or-n-p)

;; Set color theme
(require 'color-theme-tomorrow)
(color-theme-tomorrow--define-theme night)


;; Powerful tool to manage file- and buffer- interfacing
(require 'ido)
(ido-mode t)


;;; rc-ui.el ends here
