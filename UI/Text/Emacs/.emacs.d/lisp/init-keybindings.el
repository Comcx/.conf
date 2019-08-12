;; Comcx's Key bindings
;; 2018-12-20


;; Shortcut for init.el
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; Bind to <F2>
(global-set-key (kbd "<f2>") 'open-init-file)

;; Shortcut for shell buffer
(setq shell-num 0)
(defun open-shell ()
  (interactive)
  (shell)
  (rename-buffer (concat "shell" (number-to-string shell-num)))
  (setq shell-num (+ shell-num 1)))
(global-set-key (kbd "C-c s") 'open-shell)

;; Shortcut for window-up resizing
(defun resize-window-up ()
  (interactive)
  (enlarge-window 1))
(global-set-key (kbd "C-^") 'resize-window-up)


(defun resize-window-left ()
  (interactive)
  (shrink-window-horizontally 1))

(defun resize-window-right ()
  (interactive)
  (enlarge-window-horizontally 1))
(global-set-key (kbd "C-{") 'resize-window-left)
(global-set-key (kbd "C-}") 'resize-window-right)

(provide 'init-keybindings)










