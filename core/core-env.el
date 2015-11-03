;;; core-env.el ---


;; Reduce the frequency of garbage collection by making it happen on
;; each 10MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 10000000)


;;; core-env.el ends here
