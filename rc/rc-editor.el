;;; rc-editor.el ---


;; Take care of the whitespace
(use-package whitespace
  :ensure t
  :config
  (setq whitespace-style '(face trailing lines-tail
                                space-before-tab
                                indentation space-after-tab)
      whitespace-line-column 80))

;; Superb Git interface
(if (version< emacs-version "24.4")
    (message "magit is not available for the current Emacs version")
  (use-package magit
    :ensure t
    :defer t))

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
  ;; Show suggestions' numbers
  (setq company-show-numbers t))

;; Configure autocompletion framework
(use-package helm
  :ensure t
  :init
  (progn
    (require 'helm-config)
    (setq helm-split-window-in-side-p t
          helm-M-x-fuzzy-match t
          helm-buffers-fuzzy-matching t
          helm-recentf-fuzzy-match t
          helm-move-to-line-cycle-in-source t
          helm-ff-search-library-in-sexp t
          helm-ff-file-name-history-use-recentf t
          helm-echo-input-in-header-line t
          helm-display-buffer-default-height 12)
    (use-package helm-swoop
      :ensure t)
    ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
    ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
    ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
    ;; (c) Emacs Prelude
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))

    (custom-set-faces
     '(helm-selection ((t (:inherit highlight :background "white")))))
    
    (helm-mode))
  :diminish helm-mode
  :bind (("C-c h" . helm-mini)
         ("C-c i" . helm-imenu)
         ("C-s" . helm-swoop)
         ("C-h a" . helm-apropos)
         ("C-x f" . helm-recentf)
         ("C-x b" . helm-for-files)
         ("C-x C-x" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)))

;; Configure project interaction tool
(use-package projectile
  :ensure t
  :init
  (progn
    (setq projectile-completion-system 'helm
          projectile-create-missing-test-files t
          projectile-switch-project-action #'projectile-commander)
    (projectile-global-mode))
  :diminish projectile-mode)

(use-package helm-projectile
  :ensure t
  :init (progn
          (helm-projectile-on)
          (setq helm-for-files-preferred-list
                '(helm-source-buffers-list
                  helm-source-projectile-files-list
                  helm-source-recentf
                  helm-source-bookmarks
                  helm-source-file-cache
                  helm-source-files-in-current-dir
                  helm-source-locate))))

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


;;; rc-editor.el ends here
