;; Comcx's Color theme settings
;; Change theme automatically by current time.



(add-to-list 'load-path "~/.emacs.d/lisp/")
;(require 'jazz-theme)
;(require 'infodoc-theme)


(setq day-theme 'dichromacy)
(setq dark-theme 'wombat)

(defun synchronize-theme ()
    (setq hour
        (string-to-number
            (substring (current-time-string) 11 13)))
    (if (member hour (number-sequence 6 18))
        (setq now day-theme)
      (setq now dark-theme))

    (load-theme now))


;(synchronize-theme)
(run-with-timer 0 3600 'synchronize-theme)


(global-set-key
 (kbd "C-c d a y")
 (lambda () (interactive)
   (load-theme 'infodoc)))

(global-set-key
 (kbd "C-c n o x")
 (lambda () (interactive)
   (load-theme 'jazz)))





;; Don't show GNU Emacs init page
(setq inhibit-splash-screen t)

;; Set default window config
(set-frame-position (selected-frame) 0 0)

(set-frame-width  (selected-frame) 110)
(set-frame-height (selected-frame) 30)

;; Set cursor type
(setq-default cursor-type 'box)
(set-cursor-color "#00c800") 




;; Emacsを半透明・透明にする
(global-set-key "\C-xa" 
  (lambda () (interactive) 
    (set-frame-parameter nil 'alpha 64)))
(global-set-key "\C-xg"
  (lambda () (interactive)
     (set-frame-parameter nil 'alpha 100)))







;; Fonts
;; Unfortunately, Emacs blurs when viewing non-English chars
;; Use setq below if u're using emacs in windows
(setq inhibit-compacting-font-caches t) ; Don’t compact font caches during GC.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))


;; Set line number display
(global-linum-mode 1) ; always show line numbers                        
(setq linum-format " %4d ")  ;set format

;; Highlight current line
(global-hl-line-mode 1)

;; Hide tool bar
(tool-bar-mode -1)





;; 设置垃圾回收，在Windows下，emacs25版本会频繁出发垃圾回收，所以需要设置
(when (eq system-type 'windows-nt)
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect)
  ;; 显示垃圾回收信息，这个可以作为调试用;;
  (setq garbage-collection-messages t))












(provide 'init-ui)
