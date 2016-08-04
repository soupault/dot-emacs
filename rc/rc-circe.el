;;; rc-circe.el ---


;; Indicate last read position with the bar
(enable-lui-track-bar)

;; Paint nicknames in different colors
(require 'circe-color-nicks)
(enable-circe-color-nicks)

;; Turn off service messages (JOIN/QUIT) for silent users
(setq circe-reduce-lurker-spam t)

;; Use circular nickname autocompletion
(setq circe-use-cycle-completion t)

;; Configure IRC-servers and connection details
(if (file-exists-p "~/.private.el")
    (load-file "~/.private.el")
  (setq freenode-passwd nil
        another-passwd nil))

(setq circe-network-options
      `(("Freenode"
         :tls t
         :nick "soupault"
         :sasl-username "soupault"
         :sasl-password ,freenode-passwd
         :channels ("#python" "#archlinux" "#ocaml" "#emacs")
         )))

;; Karagarga support channel
;; (setq circe-network-options
;;       '(("BrokenSphere"
;;          :tls t
;;          :nick "soupault"
;;          :channels ("#kg-help")
;;          )))

;; Automatically adjust text width
(setq lui-time-stamp-position 'right-margin
      lui-fill-type nil)

(add-hook 'lui-mode-hook 'my-lui-setup)
(defun my-lui-setup ()
  (setq fringes-outside-margins t
        right-margin-width 8
        word-wrap t
        wrap-prefix ""))


;;; rc-circe.el ends here
