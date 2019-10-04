;; Comcx's Org mode settings
;; 2018-12-20



(require 'org)


;; Org Setting
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

(setq org-agenda-files
      '("~/Workspace/Note/Day.org"))

;;(custom-set-variables
;;'(org-directory "c:/Users/HP/Desktop/workspace/orghub/Final-test/")
;;'(org-agenda-files (list org-directory)))



;;(setq org-agenda-files (directory-files-recursively "~/org" "\.org$"))


(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO"      :foreground "red"          :weight bold)
              ("NEXT"      :foreground "blue"         :weight bold)
              ("DONE"      :foreground "forest green" :weight bold)
              ("WAITING"   :foreground "orange"       :weight bold)
              ("HOLD"      :foreground "magenta"      :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING"   :foreground "forest green" :weight bold)
              ("PHONE"     :foreground "forest green" :weight bold))))



;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   ;(cpp . t)
   ;(sh . t)
   (haskell . t)
   (java . t)
   (js . t)
   (python . t)
   ;(scala . t)
   (R . t)
   (lisp . t)
   (emacs-lisp . t)))

(setq org-src-fontify-natively t)

(setq org-edit-src-content-indentation 0)
(setq org-src-tab-acts-natively t)
(setq org-src-preserve-indentation t)

(setq org-hide-emphasis-markers t)
(setq org-pretty-entitles t)

;; use org-bullets-mode for utf8 symbols as org bullets
(require 'org-bullets)
;; make available "org-bullet-face" such that I can control the font size individually
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list
  ;'("✙" "♱" "♰" "☥" "✞" "✟" "✝" "†" "✠" "✚" "✜" "✛" "✢" "✣" "✤" "✥")
  ;'("○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙" "⊚" "⊛" "∙" "∘"))
  '("☯" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙" "⊚" "⊛" "∙" "∘")) 




;(require 'LaTeX-math-mode)






(provide 'init-org)


