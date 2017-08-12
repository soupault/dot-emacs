;;; rc-global-bindings.el ---


(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-d") 'kill-whitespace-or-word)
(global-set-key (kbd "M-;") 'comment-eclipse)

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;; rc-global-bindings.el ends here
