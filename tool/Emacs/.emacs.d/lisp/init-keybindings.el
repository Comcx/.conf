;; Comcx's Key bindings
;; 2018-12-20


;; Shortcut for init.el
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; Bind to <F2>
(global-set-key (kbd "<f2>") 'open-init-file)








(provide 'init-keybindings)










