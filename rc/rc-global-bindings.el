;;; rc-global-bindings.el ---


(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-d") 'kill-whitespace-or-word)
(global-set-key (kbd "M-;") 'comment-eclipse)

;; (global-set-key (kbd "C-x C-x") 'ido-switch-buffer)
;; (global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-x C-x") 'ivy-switch-buffer)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;; rc-global-bindings.el ends here
