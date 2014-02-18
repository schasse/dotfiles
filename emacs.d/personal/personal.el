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
(prelude-require-packages '(git-gutter+ escreen))

;; ruby
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren nil)
;; (add-hook 'ruby-mode-hook 'linum-mode)
(define-key ruby-tools-mode-map (kbd "C-c '") 'ruby-tools-to-single-quote-string)
(define-key ruby-tools-mode-map (kbd "C-c \"") 'ruby-tools-to-double-quote-string)
(define-key ruby-tools-mode-map (kbd "C-c :") 'ruby-tools-to-symbol)
(define-key ruby-tools-mode-map (kbd "C-c ;") 'ruby-tools-clear-string)

;; js
(setq js-indent-level 2)

;; keybindings
;; (global-set-key (kbd "C-#") 'comment-region)
;; (global-set-key (kbd "C-'") 'uncomment-region)
;; (global-set-key (kbd "C-ö") 'hippie-expand)
(define-key prelude-mode-map (kbd "C-c f") 'projectile-find-file)
(define-key prelude-mode-map (kbd "C-M-o") 'prelude-smart-open-line-above)
(define-key prelude-mode-map (kbd "C-M-j") 'prelude-top-join-line)
(define-key prelude-mode-map (kbd "C-M-e") 'er/expand-region)

;; git-gutter+
(global-git-gutter+-mode t)

;; multi-term
;; (setq multi-term-program "/bin/zsh")
;; (global-set-key (kbd "C-c T") 'multi-term)
;; (define-key prelude-mode-map (kbd "C-c t") 'multi-term-next)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote("\n-> "
                             ""
                             "\n   "
                             "\n   ..."
                             "["
                             "]"
                             " [No match]"
                             " [Matched]"
                             " [Not readable]"
                             " [Too big]"
                             " [Confirm]")))

(defun ido-disable-line-truncation ()
  "Truncate long lines."
  (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)

(defun ido-define-keys ()
  "C-n/p is more intuitive in vertical layout."
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)
;;; personal.el ends here
