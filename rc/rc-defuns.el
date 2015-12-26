;;; rc-defuns.el ---

;; Comment current line if no region is selected
(defun comment-eclipse ()
  (interactive)
  (let ((start (line-beginning-position))
        (end (line-end-position)))
    (when (region-active-p)
      (setq start (save-excursion
                    (goto-char (region-beginning))
                    (beginning-of-line)
                    (point))
            end (save-excursion
                  (goto-char (region-end))
                  (end-of-line)
                  (point))))
    (comment-or-uncomment-region start end)))


;; If cursor stands on whitespace, delete it till the next word
(defun kill-whitespace-or-word ()
  (interactive)
  (if (looking-at "[ \t\n]")
      (let ((p (point)))
        (re-search-forward "[^ \t\n]" nil :no-error)
        (backward-char)
        (kill-region p (point)))
    (kill-word 1)))


;; Kills the current buffer and deletes the file it is visiting
(defun delete-file-and-buffer ()
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (delete-file filename)
      (message "Deleted file %s" filename)))
  (kill-buffer))


;; Allows to open the underlying file of a buffer in an external program
(defun open-with ()
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (if (eq system-type 'darwin)
                        "open"
                      (read-shell-command "Open current file with: "))
                    " "
                    buffer-file-name))))


;; Rename the current buffer and file it is visiting.
(defun rename-file-and-buffer ()
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))


;;; rc-defuns.el ends here
