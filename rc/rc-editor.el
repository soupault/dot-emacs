;;; rc-editor.el ---


;; Powerful tool to manage file- and buffer- interfacing
(use-package ido
  :ensure t
  :config (ido-mode t))

;; Take care of the whitespace
(use-package whitespace
  :ensure t
  :config
  (setq whitespace-style '(face trailing lines-tail
                              space-before-tab
                              indentation space-after-tab)
      whitespace-line-column 80))

;; Various things
(setq-default indent-tabs-mode nil  ;; don't use tabs to indent
              tab-width 4           ;; but maintain correct appearance
              case-fold-search t    ;; case INsensitive search
              default-directory "~"
              fill-column 80)

(setq next-line-add-newlines nil  ;; don't add new lines when scrolling down
      require-final-newline t     ;; end files with a newline
      mouse-yank-at-point t       ;; yank at cursor, NOT at mouse position
      kill-whole-line t)

;; Delete the selection with a keypress
(delete-selection-mode t)

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Show line numbers
(add-hook 'prog-mode-hook 'linum-mode)

;; Configure company-mode
(add-hook 'prog-mode-hook 'global-company-mode)
(setq company-show-numbers t)  ;; show suggestions' numbers

;; Help with parentheses
(use-package smartparens
  :ensure t
  :config (add-hook 'prog-mode-hook #'smartparens-mode))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Highlight paired parenthesis
(show-paren-mode t)


;;; rc-editor.el ends here
