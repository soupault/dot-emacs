;;; init.el ---


;; Suppress automatic generation of this line (is called in core-packages.el)
;; (package-initialize)

(defvar local-dir user-emacs-directory
  "The root dir of the Emacs configuration.")

(defun local-file-name (file-name)
  (let* ((file-path (expand-file-name file-name local-dir))
         (parent-dir (file-name-directory file-path)))
    (unless (or (not parent-dir)
                (file-exists-p parent-dir))
      (make-directory parent-dir))
    file-path))

(setq load-prefer-newer t)

(load (local-file-name "core/core-packages"))
(load (local-file-name "core/core-env"))

(load (local-file-name "rc/rc-ui"))
(load (local-file-name "rc/rc-editor"))
(load (local-file-name "rc/rc-languages"))
(load (local-file-name "rc/rc-defuns"))
(load (local-file-name "rc/rc-global-bindings"))

(load (local-file-name "rc/rc-circe"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (circe-notifications circe auctex markdown-mode tuareg rust-mode cmake-mode cython-mode elpy python-mode rainbow-delimiters smartparens company magit swiper smex ido-vertical-mode exec-path-from-shell use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; init.el ends here
