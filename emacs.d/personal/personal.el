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
(prelude-require-packages '(git-gutter escreen))

;; ruby
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren nil)
;; (add-hook 'ruby-mode-hook 'linum-mode)

;; keybindings
;; (global-set-key (kbd "C-#") 'comment-region)
;; (global-set-key (kbd "C-'") 'uncomment-region)
;; (global-set-key (kbd "C-ö") 'hippie-expand)
(define-key prelude-mode-map (kbd "C-c f") 'projectile-find-file)
(define-key prelude-mode-map (kbd "C-M-o") 'prelude-smart-open-line-above)
(define-key prelude-mode-map (kbd "C-M-j") 'prelude-top-join-line)

;; git-gutter
(require 'git-gutter)
(global-git-gutter-mode t)

;; multi-term
;; (setq multi-term-program "/bin/zsh")
;; (global-set-key (kbd "C-c T") 'multi-term)
;; (define-key prelude-mode-map (kbd "C-c t") 'multi-term-next)

;;; personal.el ends here
