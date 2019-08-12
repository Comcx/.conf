;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |

(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			     ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)



;; Add Packages
(defvar my/packages
  '( ;; --- Auto-completion ---
     company
     ;; --- Better Editor ---
     smooth-scrolling
     ;hungry-delete
     ;swiper
     ;counsel
     ;smartparens
     ;popwin
     ;; --- Major Mode ---
     web-mode
     js2-mode
     ;org-mode
     markdown-mode
     ;; --- Themes ---
     ;monokai-theme

     ;; ...
    ) "Default packages")

;; Rainbow brackets
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Neotree added;
(add-to-list 'load-path "~/.emacs.d/elpa/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme 'ascii)



(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
    when (not (package-installed-p pkg)) do (return nil)
    finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(add-hook 'prog-mode-hook 'company-mode)






;; end of file
(provide 'init-packages)
			   
