;; Comcx's Color theme settings
;; Change theme automatically by current time.



(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme/")

;; setup titlebar appearance
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))


(setq day-theme 'dichromacy)
(setq nox-theme 'tangotango)

(defun synchronize-theme ()
    (setq hour
        (string-to-number
            (substring (current-time-string) 11 13)))
    (if (member hour (number-sequence 6 18))
        (setq now day-theme)
        (setq now nox-theme))

    (load-theme now))


;(synchronize-theme)
(run-with-timer 0 3600 'synchronize-theme)


(global-set-key
 (kbd "C-c d a y")
 (lambda () (interactive)
  ;(load-theme 'infodoc)
   (load-theme day-theme)))

(global-set-key
 (kbd "C-c n o x")
 (lambda () (interactive)
   (load-theme nox-theme)))





;; Don't show GNU Emacs init page
(setq inhibit-splash-screen t)

;; Set default window config
(set-frame-position (selected-frame) 0 0)

;(set-frame-width  (selected-frame) 110)
;(set-frame-height (selected-frame) 30)

;; Set cursor type
(setq-default cursor-type 'box)
(set-cursor-color "#00c800") 



;; Emacsを半透明・透明にする
(global-set-key "\C-xa" 
  (lambda () (interactive) 
    (set-frame-parameter nil 'alpha 86)))
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
 '(default
    ((t (:family  "Source Code Pro"
	 :foundry "outline"
	 :slant   normal
	 :weight  normal
	 :height  120
	 :width   normal))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "gold"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "coral"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "purple"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "red"))))
 
)


;; Set line number display
(global-linum-mode 1) ; always show line numbers                        
(setq linum-format " %4d ")  ;set format

;; Highlight current line
(global-hl-line-mode 1)

;; Hide tool bar
(tool-bar-mode nil)



;; 设置垃圾回收，在Windows下，emacs25版本会频繁出发垃圾回收，所以需要设置
(when (eq system-type 'windows-nt)
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect)
  ;; 显示垃圾回收信息，这个可以作为调试用;;
  (setq garbage-collection-messages t))






;; Math Symbols
(require 'pretty-mode)

(defun my/add-visual-replacement (from to)
  "Make `prettify-symbols-mode' replace string FROM with string TO.

Updates `prettify-symbols-alist'.  You may need to toggle
`prettify-symbols-mode' to make the changes take effect.

Each character of TO is vertically aligned using the baseline,
such that base-left of the character is aligned with base-right
of the preceding character.  Refer to `reference-point-alist'
for more information."
  (push (cons from (let ((composition nil))
                     (dolist (char (string-to-list to)
                                   (nreverse (cdr composition)))
                       (push char composition)
                       (push '(Br . Bl) composition))))
        prettify-symbols-alist))


(defun prettify-python()
  (add-hook 'python-mode-hook
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
         ("Union" .    #x22c3))))))

(defun prettify-haskell ()
  (add-hook 'haskell-mode-hook 'pretty-mode))

(defun prettify-scala ()
  (add-hook 'scala-mode-hook
   (lambda ()
     (my/add-visual-replacement "import" ">>>")
     (my/add-visual-replacement "{" "$")
     (my/add-visual-replacement "}" ".")
     (mapc (lambda (pair) (push pair prettify-symbols-alist))
       '(;; Syntax
         ("def" .      #x2131)
	 ;("not" .      #x2757)
	 ;("=>".        ?⇒)
         ("in" .       #x2208)
         ("not in" .   #x2209)
         ("return" .   #x27fc)
         ("yield" .    #x27fb)
         ("for" .      #x2200)
         ;; Base Types
         ("Int" .      #x2124)
         ("Float" .    #x211d)
         ("String" .      #x1d54a)
         ("true" .     #x1d54b)
         ("false" .    #x1d53d)
         ;; Mypy
         ("Dict" .     #x1d507)
         ("List" .     #x2112)
         ("Tuple" .    #x2a02)
         ("Set" .      #x2126)
         ("Iterable" . #x1d50a)
         ("Any" .      #x2754)
         ("Union" .    #x22c3))))))

(defun prettify-cxx ()
  (add-hook 'c++-mode-hook
   (lambda ()
     (my/add-visual-replacement "#include" ">>=")
     (my/add-visual-replacement "auto" "var")
     (my/add-visual-replacement "int" "Int")
     (my/add-visual-replacement "bool" "Bool")
     (my/add-visual-replacement "void" "Void")
     (my/add-visual-replacement "string" "String")
     (my/add-visual-replacement "vector" "Vector")
     (my/add-visual-replacement "map" "Map")
     (my/add-visual-replacement "list" "List")
     (my/add-visual-replacement "double" "Double")
     (my/add-visual-replacement "char" "Char")
     ;(my/add-visual-replacement "{" "$")
     ;(my/add-visual-replacement "}" ".")
     (mapc (lambda (pair) (push pair prettify-symbols-alist))
       '(;; Syntax
         ("function" .      #x2131)
	 ("template" .      ?λ)
	 ;("not" .      #x2757)
	 ;("=>".        ?⇒)
         (":" .       #x2208)
         ("not in" .   #x2209)
         ("return" .   #x27fc)
         ("yield" .    #x27fb)
         ;("for" .      #x2200)
         ;; Base Types
         ;("int" .      #x2124)
         ("float" .    #x211d)
         ;("string" .      #x1d54a)
         ("true" .     #x1d54b)
         ("false" .    #x1d53d)
         ;; Mypy
         ;("Dict" .     #x1d507)
         ;("List" .     #x2112)
         ("pair" .    #x2a02)
         ;("Set" .      #x2126)
         ;("Iterable" . #x1d50a)
         ;("Any" .      #x2754)
         ("union" .    #x22c3))))))


(defun prettify-pl (pl)
  (pcase pl
    ('Python  (prettify-python))
    ('Haskell (prettify-haskell))
    ('Scala   (prettify-scala))
    ('C++     (prettify-cxx))
    (others  nil)))

(defun prettify-me(b)
  (if b
    (progn
      (global-pretty-mode t)
      (pretty-deactivate-groups
        '(:equality :ordering :ordering-double :ordering-triple
          :arrows   :arrows-twoheaded :punctuation
          :logic :sets))

      (pretty-activate-groups
        '(:sub-and-superscripts :greek :arithmetic-nary))

      (global-prettify-symbols-mode 1))
    nil))

(defun prettify ()
  (interactive)
  (prettify-me t))

(prettify-me nil)
;(prettify-pl 'Python)
;(prettify-pl 'Haskell)
;(prettify-pl 'Scala)
;(prettify-pl 'C++)








(provide 'init-ui)
