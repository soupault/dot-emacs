;;; rc-languages.el ---


;; Python

(use-package python-mode
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :commands python-mode
  :config (progn
            (add-hook 'python-mode-hook (lambda () (run-hooks 'prog-mode-hook)))
            (add-hook 'python-mode-hook
                      (lambda ()
                        ;; See https://github.com/company-mode/company-mode/issues/105
                        ;; for details on this nasty bug.
                        (remove-hook 'completion-at-point-functions
                                     'py-shell-complete t)
                        (subword-mode +1)
                        (electric-indent-mode -1)))))

(use-package cython-mode
  :ensure t
  :commands cython-mode
  :config (add-hook 'cython-mode-hook
                    (lambda ()
                      ;; same bug for cython, damit!
                      (remove-hook 'completion-at-point-functions
                                   'py-shell-complete t))))


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


;; R

(use-package ess-site
  :ensure ess
  :commands R
  :init (progn
          ;; TODO: why doesn't use-package require it for us?
          (require 'ess-site)

          (setq ess-eval-visibly-p nil
                ess-use-tracebug t
                ess-use-auto-complete t
                ess-help-own-frame 'one
                ess-ask-for-ess-directory nil)
          (setq-default ess-dialect "R")
          (ess-toggle-underscore t)))

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
