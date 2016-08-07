;;; core-env.el ---


;; Export env variables if loaded from graphic mode
(use-package exec-path-from-shell
  :ensure t
  :init
  (if (display-graphic-p)
      (exec-path-from-shell-initialize)))


;; Reduce the frequency of garbage collection by making it happen on
;; each 10MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 10000000)


;;; core-env.el ends here
