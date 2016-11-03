;;; rc-languages.el ---


;; Python
(use-package python-mode
  :ensure t
  :mode "\\.py\\'"
  :init
  (use-package elpy
    :ensure t
    :config (elpy-enable)))

;; Cython
(use-package cython-mode
  :ensure t
  :mode "\\.pyx\\'")

;; C, C++
(use-package cc-mode
  :ensure t
  :mode ("\\.c\\'" "\\.h\\'" "\\.cc\\'" "\\.cpp\\'" "\\.hpp\\'")
  :init (add-hook 'c-mode-common-hook
                  '(lambda ()
                     (local-set-key (kbd "RET") 'newline-and-indent)
                     (setq c-default-style "linux"
                           c-basic-offset 4)
                     (c-set-offset 'substatement-open 0))))

(use-package cmake-mode
  :ensure t)

;; Rust
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'")

;; OCaml
(use-package tuareg
  :ensure t
  :mode ("\\.ml\\'" "\\.mli\\'")
  :commands tuareg-mode
  :config
  (when (executable-find "opam")
    (add-to-list 'load-path
                 (concat
                  (replace-regexp-in-string
                   "\n$" ""
                   (shell-command-to-string "opam config var share"))
                  "/emacs/site-lisp"))
    (require 'ocp-indent)
    (when (require 'merlin nil t)
      (add-hook 'tuareg-mode-hook 'merlin-mode t)
      (add-hook 'caml-mode-hook 'merlin-mode t)
      (setq merlin-command 'opam))))


;; Octave
(use-package octave-mode
  :mode "\\.m\\'")

;; Elisp
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(defun recompile-elc-on-save ()
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil t))

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'recompile-elc-on-save)

(use-package eldoc
  :diminish eldoc-mode)

;; Markdown
(use-package markdown-mode
  :defer t
  :ensure t
  :mode "\\.md\\'")

;; HTML, CSS
;; (add-hook 'sgml-mode-hook (lambda () (setq tab-width 2)))

;; (use-package rainbow-mode
;;   :ensure rainbow-mode
;;   :diminish rainbow-mode
;;   :config (progn
;;             (add-hook 'html-mode-hook 'rainbow-turn-on)
;;             (add-hook 'css-mode-hook 'rainbow-turn-on)))

;; (use-package smartparens
;;   :ensure smartparens
;;   :init (sp-with-modes '(html-mode sgml-mode)
;;           (sp-local-pair "<" ">")))

;; LaTeX via AucTeX
(use-package tex-mode
  :ensure auctex
  :mode "\\.tex\\'"
  :init (progn
          (require 'texmathp)
          (setq TeX-auto-save t
                TeX-parse-self t)
          (add-hook 'LaTeX-mode-hook '(lambda ()
                                        (LaTeX-math-mode 1)
                                        (TeX-fold-mode 1)
                                        (TeX-PDF-mode 1)
                                        (outline-minor-mode 1)))))


;;; rc-languages.el ends here
