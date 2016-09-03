;;; rc-circe.el ---


(use-package circe
  :ensure t)

;; Adjust scroll behaviour in the best possible way
(setq lui-scroll-behavior "post-output")

;; Enable and configure popup notifications
(use-package circe-notifications
  :ensure t
  :init
  (autoload 'enable-circe-notifications "circe-notifications" nil t)
  (add-hook 'circe-server-connected-hook 'enable-circe-notifications))

;; Indicate last read position with the bar
(enable-lui-track-bar)

;; Paint nicknames in different colors
(require 'circe-color-nicks)
(enable-circe-color-nicks)

;; Turn off service messages (JOIN/QUIT) for silent users
(setq circe-reduce-lurker-spam t)

;; Use circular nickname autocompletion
(setq circe-use-cycle-completion t)

;; Automatically adjust text width
(setq lui-time-stamp-position 'right-margin
      lui-fill-type nil)

(add-hook 'lui-mode-hook 'my-lui-setup)
(defun my-lui-setup ()
  (setq fringes-outside-margins t
        right-margin-width 8
        word-wrap t
        ;; add indentation to wrapped lines
        wrap-prefix "  "))

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
         :channels ("#python" "#archlinux" "#archlinux-ec2"
                    "#ocaml" "#emacs")
         )
        ("Mozilla"
         :host "irc.mozilla.org"
         :port 6697
         :tls t
         :nick "soupault"
         :sasl-username "soupault"
         :sasl-password ,mozilla-passwd
         :channels ("#rust" "#rust-beginners")
         )
      ;; Karagarga support channel
        ("BrokenSphere"
         :tls t
         :nick "soupault"
         :channels ("#kg-help")
         )))

(defun irc ()
  "Connect to IRC"
  (interactive)
  (circe "Freenode"))


;;; rc-circe.el ends here
