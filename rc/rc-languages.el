;;; rc-languages.el ---


;; Python
(use-package python-mode
  :ensure t
  :init
  (use-package elpy
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


;;; rc-languages.el ends here
