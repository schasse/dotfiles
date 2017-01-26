;;; personal.el --- personal configuration of prelude

;;; Commentary:
;; some changes and extended configs

;;; Code:

;; misc
(setq prelude-guru nil)
(blink-cursor-mode t)
;;(scroll-bar-mode -1)
(set-display-table-slot standard-display-table 'wrap ?\ )
;; warn when opening files bigger than 50MB
(setq large-file-warning-threshold 50000000)
(setq flx-ido-threshhold 1000)
(setq fill-column 80)

;; additional packages
(prelude-require-packages
 '(git-gutter+ escreen rvm robe bundler rspec-mode ido-vertical-mode vlf
               multiple-cursors emmet-mode ag ein company))
;;(require personal)

(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(global-git-gutter+-mode t)
;;(add-to-list 'mc/unsupported-minor-modes 'smartparens-mode)

;; company (autocompletion)
(setq company-idle-delay .1)
(setq company-transformers
      '(company-sort-by-occurrence
        company-sort-by-backend-importance))

;; keybindings
(global-set-key [remap other-window] 'nil)
(define-key prelude-mode-map (kbd "C-c f") 'projectile-find-file)
(define-key prelude-mode-map (kbd "C-M-o") 'crux-smart-open-line-above)
(define-key prelude-mode-map (kbd "C-M-j") 'crux-top-join-line)
(define-key prelude-mode-map (kbd "C-M-e") 'er/expand-region)
(define-key prelude-mode-map (kbd "M-/") 'company-manual-begin)
;;(global-set-key (kbd "C-M-c C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-m") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-r") 'mc/mark-previous-like-this)
;;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; auto balance my windows
(defadvice split-window-right (after restore-balanace-below activate)
  (balance-windows))
(defadvice delete-window (after restore-balance activate)
  (balance-windows))

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
;; (add-to-list 'ac-modes 'coffee-mode)

;; sh
(setq sh-basic-offset 2)
(setq sh-indentation 2)

;; html
(setq web-mode-markup-indent-offset 2)

;; emmet
(add-hook 'sgml-mode-hook 'emmet-mode)

;; language
(setq ispell-dictionary "en")

;; nice shortcuts
(defun projectile-escreen-ag ()
  "Run projectiles search in a new screen."
  (interactive
   (progn (escreen-create-screen-dim)
          (crux-switch-to-previous-buffer)
          (call-interactively 'projectile-ag)))
  )

(define-key prelude-mode-map (kbd "C-c s") 'projectile-escreen-ag)

;;; personal.el ends here
