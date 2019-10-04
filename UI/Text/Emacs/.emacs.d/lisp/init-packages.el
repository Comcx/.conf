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

;; Math Symbols
(require 'pretty-mode)
(global-pretty-mode t)

(pretty-deactivate-groups
 '(:equality :ordering :ordering-double :ordering-triple
             :arrows :arrows-twoheaded :punctuation
             :logic :sets))

(pretty-activate-groups
 '(:sub-and-superscripts :greek :arithmetic-nary))

(global-prettify-symbols-mode 1)

(add-hook
 'python-mode-hook
 (lambda ()
   (mapc (lambda (pair) (push pair prettify-symbols-alist))
         '(;; Syntax
           ("def" .      #x2131)
           ("not" .      #x2757)
           ("in" .       #x2208)
           ("not in" .   #x2209)
           ("return" .   #x27fc)
           ("yield" .    #x27fb)
           ("for" .      #x2200)
           ;; Base Types
           ("int" .      #x2124)
           ("float" .    #x211d)
           ("str" .      #x1d54a)
           ("True" .     #x1d54b)
           ("False" .    #x1d53d)
           ;; Mypy
           ("Dict" .     #x1d507)
           ("List" .     #x2112)
           ("Tuple" .    #x2a02)
           ("Set" .      #x2126)
           ("Iterable" . #x1d50a)
           ("Any" .      #x2754)
           ("Union" .    #x22c3)))))





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
			   
