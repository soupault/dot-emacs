;;; rc-languages.el ---


;; Python
(use-package python-mode
  :ensure t
  :init
  (use-package elpy
    :ensure t
    :config (elpy-enable))
  :mode ("\\.py\\'" . python-mode))


;; Cython
(use-package cython-mode
  :ensure t
  :commands cython-mode)


;; C, C++
(use-package cc-mode
  :init (add-hook 'c-mode-common-hook
                  '(lambda ()
                     (local-set-key (kbd "RET") 'newline-and-indent)
                     (setq c-default-style "linux"
                           c-basic-offset 4)
                     (c-set-offset 'substatement-open 0))))

(use-package cmake-mode
  :ensure t)


;; OCaml
(use-package tuareg
  :ensure t
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
  :mode "\\.m$")


;; Elisp
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(defun recompile-elc-on-save ()
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil
            t))

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'recompile-elc-on-save)

(use-package eldoc
  :diminish eldoc-mode)


;; Markdown
(use-package markdown-mode
  :ensure t
  :commands markdown-mode
  :mode "\\.md\\|\\.markdown")


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


;; gettext
(when (require 'po-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.po\\'\\|\\.po\\." . po-mode))
  (autoload 'po-mode "po-mode" "Major mode for translators to edit PO files" t))


;; LaTeX via AucTeX
(eval-after-load "tex"
  '(setcdr (assoc "LaTeX" TeX-command-list)
          '("%`%l%(mode) -shell-escape%' %t"
          TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX")))

(use-package tex-site
  :ensure auctex
  :init (progn
          (require 'texmathp)

          (setq TeX-auto-save t
                TeX-parse-self t
                TeX-DVI-via-PDFTeX t)

          (add-hook 'LaTeX-mode-hook '(lambda ()
                                        (LaTeX-math-mode 1)
                                        (TeX-fold-mode 1)
                                        (TeX-PDF-mode 1)
                                        (outline-minor-mode 1)))))


;;; rc-languages.el ends here
