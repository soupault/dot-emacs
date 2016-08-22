;;; init.el ---


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


;;; init.el ends here
