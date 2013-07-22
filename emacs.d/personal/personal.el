;;; personal.el --- personal configuration of prelude

;;; Commentary:
;; some changes and extended configs

;;; Code:

;; misc
(setq prelude-guru nil)
(blink-cursor-mode t)
(scroll-bar-mode -1)

;; additional packages
(prelude-ensure-module-deps '(git-gutter-fringe escreen))

;; ruby
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren nil)
(add-hook 'ruby-mode-hook 'linum-mode)

;; keybindings
(global-set-key (kbd "C-#") 'comment-region)
(global-set-key (kbd "C-'") 'uncomment-region)
(global-set-key (kbd "C-ö") 'hippie-expand)
(define-key prelude-mode-map (kbd "C-c f") 'projectile-find-file)

;; git-gutter-fringe
(require 'git-gutter-fringe)
(global-git-gutter-mode t)

;; multi-term
(setq multi-term-program "/bin/zsh")
(global-set-key (kbd "C-c T") 'multi-term)
(define-key prelude-mode-map (kbd "C-c t") 'multi-term-next)

;;; personal.el ends here
