;; Comcx's Key bindings
;; 2018-12-20


;; Shortcut for init.el
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; Bind to <F2>
(global-set-key (kbd "<f2>") 'open-init-file)

(setq shell-num 0)
(defun open-shell ()
  (interactive)
  (shell)
  (rename-buffer (concat "shell" (number-to-string shell-num)))
  (setq shell-num (+ shell-num 1)))
(global-set-key (kbd "C-c s") 'open-shell)

(defun resize-window ()
  (message "underwork..."))
;(global-set-key (kbd "C-c s") 'open-init-file)




(provide 'init-keybindings)










