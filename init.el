;;; init.el ---


(defvar bobry-dir (file-name-directory (or (buffer-file-name)
                                           load-file-name))
  "The root dir of the Emacs configuration.")

(defvar bobry-snippets-dir (concat bobry-dir "snippets/")
  "This folder stores custom yasnippet bundles.")

(defvar bobry-cache-dir (concat bobry-dir "cache/")
  "This folder stores all the automatically generated save/history-files.")

(unless (file-exists-p bobry-cache-dir)
  (make-directory bobry-cache-dir))


(add-to-list 'load-path bobry-dir)
(add-to-list 'load-path (concat bobry-dir "el-get/el-get"))

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s) (goto-char (point-max)) (eval-print-last-sexp))))


(setq el-get-packages
      (append
       '(el-get
         ;; generally useful stuff
         auto-complete icomplete+ yasnippet volatile-highlights
         ;; vcs
         magit
         ;; programming languages
         coffee-mode haskell-mode clojure-mode python-mode ;; ess
         ;; markup
         markdown-mode
         ;; rest
         pkgbuild-mode deft)
       (mapcar 'el-get-source-name el-get-sources)))


(el-get 'sync el-get-packages)

;; OS X specific settings
(when (eq system-type 'darwin)
  (load "rc/emacs-rc-osx"))

;; ... roll out the thing!
(load "rc/emacs-rc-ui")
(load "rc/emacs-rc-defuns")
(load "rc/emacs-rc-languages")
(load "rc/emacs-rc-markup")
(load "rc/emacs-rc-editor")
(load "rc/emacs-rc-flymake")
(load "rc/emacs-rc-flyspell")
(load "rc/emacs-rc-bindings")

(setq custom-file (concat bobry-dir "custom.el"))
(load custom-file t)


;;; init.el ends here
