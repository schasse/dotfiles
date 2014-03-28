;;; personal.el --- personal configuration of prelude

;;; Commentary:
;; some changes and extended configs

;;; Code:

;; misc
(setq prelude-guru nil)
(blink-cursor-mode t)
;;(scroll-bar-mode -1)
(set-display-table-slot standard-display-table 'wrap ?\ )

;; additional packages
(prelude-require-packages
 '(git-gutter+ escreen rvm auto-complete robe bundler rspec-mode
   ido-vertical-mode))

(ido-vertical-mode 1)
(global-git-gutter+-mode t)

;; keybindings
(define-key prelude-mode-map (kbd "C-c f") 'projectile-find-file)
(define-key prelude-mode-map (kbd "C-M-o") 'prelude-smart-open-line-above)
(define-key prelude-mode-map (kbd "C-M-j") 'prelude-top-join-line)
(define-key prelude-mode-map (kbd "C-M-e") 'er/expand-region)

;; autocomplete
;;(require 'auto-complete-config)
;;(ac-config-default)
;;(global-auto-complete-mode 'auto-complete)
;;(setq ac-trigger-key "M-/")
;;(setq ac-use-quick-help nil)
;;(setq ac-auto-start nil)

;; multi-term
;; (setq multi-term-program "/bin/zsh")
;; (global-set-key (kbd "C-c T") 'multi-term)
;; (define-key prelude-mode-map (kbd "C-c t") 'multi-term-next)

;; ruby
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren nil)

(eval-after-load 'ruby-tools
  '(progn
       (define-key ruby-tools-mode-map (kbd "C-c '")
         'ruby-tools-to-single-quote-string)
       (define-key ruby-tools-mode-map (kbd "C-c \"")
         'ruby-tools-to-double-quote-string)
       (define-key ruby-tools-mode-map (kbd "C-c :")
         'ruby-tools-to-symbol)
       (define-key ruby-tools-mode-map (kbd "C-c ;")
         'ruby-tools-clear-string)))

;;(add-hook 'ruby-mode-hook 'robe-mode)
;;(add-hook 'robe-mode-hook 'robe-ac-setup)

;; haml
(add-hook 'haml-mode-hook
          (lambda ()
            (subword-mode +1)))


;; js
(setq js-indent-level 2)
(setq coffee-tab-width 2)
(add-hook 'coffee-mode-hook
          (lambda ()
            (subword-mode +1)))
(add-to-list 'ac-modes 'coffee-mode)
;;; personal.el ends here
