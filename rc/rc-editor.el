;;; rc-editor.el ---


;; Narrowing framework
(use-package ivy
  :ensure t
  :init
  (setq ivy-height 8)
  (use-package swiper
    :ensure t)
  (use-package counsel
    :ensure t)
  :config (ivy-mode t))

;; (use-package ido
;;   :ensure t
;;   :init
;;   (use-package ido-vertical-mode
;;     :ensure t
;;     :config
;;     (setq ido-max-prospects 7)
;;     (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
;;     (setq ido-vertical-show-count t))
;;   (use-package smex
;;     :ensure t
;;     :init (smex-initialize))
;;   :config
;;   (ido-mode t)
;;   (ido-vertical-mode t))

;; Take care of the whitespace
(use-package whitespace
  :ensure t
  :config
  (setq whitespace-style '(face trailing lines-tail
                                space-before-tab
                                indentation space-after-tab)
      whitespace-line-column 80))

;; Superb Git interface
(use-package magit
  :ensure t)

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
(use-package company
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'company-mode)
  ;; show suggestions' numbers
  (setq company-show-numbers t))

;; Paired parentheses helper
(use-package smartparens
  :ensure t
  :config
  (show-smartparens-global-mode)
  (add-hook 'prog-mode-hook #'smartparens-mode)

  (sp-with-modes '(emacs-lisp-mode
                   inferior-emacs-lisp-mode
                   lisp-interaction-mode
                   lisp-mode)
    ;; Disable annoying ' pairing
    (sp-local-pair "'" nil :actions nil)
    (sp-local-pair "`" "'" :when '(sp-in-string-p) :actions '(insert wrap))))

;; Use different colors for nested paired parentheses
(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Enable code snippets helpers in prog-mode
(use-package yasnippet
  :ensure t
  :config (add-hook 'prog-mode-hook #'yas-minor-mode))


;;; rc-editor.el ends here
