;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives
    '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
      ("melpa" . "http://elpa.emacs-china.org/melpa/")
      ("org"   . "https://orgmode.org/elpa/"))))

(setq package-check-signature nil)

;; cl - Common Lisp Extension
(require 'cl)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)

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
     scala-mode
     haskell-mode
     web-mode
     js2-mode
     ;org-mode ;self contain
     markdown-mode
     htmlize
     ox-reveal
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



;; org-mode export to ppt
;(require 'ox-reveal)
; set the reveal.js path
;(setq org-reveal-root "file:////home/comcx/Installs/reveal.js/")



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







(provide 'init-packages)
			   
