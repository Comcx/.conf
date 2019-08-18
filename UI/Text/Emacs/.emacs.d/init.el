
;; Comcx's Emacs settings
;; Make sure what you're doing when trying to change anything.
;; 2018-12-20




(package-initialize)
(set-language-environment 'English)

;; Encoding
(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")


(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/elpa/")
(setq default-directory "~/Workspace/") ; Change if you need



;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)	; Package management
(require 'init-ui)		; UI management
(require 'init-keybindings)	; Key bindings
(require 'init-org)		; Org mode settings
;(require 'init-web)		; Web mode settings

;;(require 'cmuscheme)


;; Do not make backup files
(setq make-backup-files nil)



;; Custom settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-safe-themes
   (quote
    ("d75b09e9a0760034d871fde1ef96b55826d63dafef577d14a01b690764c851e9" "b9a9204174c09936593d7c6e69ba300486b58999cae067d4af5d5cb180784b42" default)))
 '(package-selected-packages (quote (haskell-mode company)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))


(setq ring-bell-function 'ignore)

;; useful mode settings
(display-time-mode 1)
(column-number-mode 1)
(global-hl-line-mode t)
(show-paren-mode nil)
(display-battery-mode 1)
(tool-bar-mode -1)
;(menu-bar-mode -1)
(toggle-scroll-bar -1)
(global-auto-revert-mode t)
(global-hl-line-mode 1)

;; file edit settings
(setq tab-width                 2
      inhibit-splash-screen     t
      ;initial-scratch-message   nil
      sentence-end-double-space nil
      make-backup-files         nil
      indent-tabs-mode          nil
      make-backup-files         nil
      auto-save-default         nil)



;; ==================================================================================
;; Some package settings


;; Complete Any mode
;(global-company-mode 1)


;(use-pac
;  :ensure t
;  :pin melpa)






;;;;;;;;;;;;
;; Scheme 
;;;;;;;;;;;;

(require 'cmuscheme)
(setq scheme-program-name "racket")         ;; 如果用 Petite 就改成 "petite"


;; bypass the interactive question and start the default interpreter
(defun scheme-proc ()
  "Return the current Scheme process, starting one if necessary."
  (unless (and scheme-buffer
               (get-buffer scheme-buffer)
               (comint-check-proc scheme-buffer))
    (save-window-excursion
      (run-scheme scheme-program-name)))
  (or (scheme-get-process)
      (error "No current process. See variable `scheme-buffer'")))


(defun scheme-split-window ()
  (cond
   ((= 1 (count-windows))
    (delete-other-windows)
    (split-window-vertically (floor (* 0.68 (window-height))))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window 1))
   ((not (find "*scheme*"
               (mapcar (lambda (w) (buffer-name (window-buffer w)))
                       (window-list))
               :test 'equal))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window -1))))


(defun scheme-send-last-sexp-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-last-sexp))


(defun scheme-send-definition-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-definition))

(add-hook 'scheme-mode-hook
  (lambda ()
    (paredit-mode 1)
    (define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)
    (define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-split-window)))









