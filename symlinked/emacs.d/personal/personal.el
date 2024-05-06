;;; personal.el --- personal configuration of prelude

;;; Commentary:
;; some changes and extended configs

;;; Code:

(require 'prelude-vertico) ;; A powerful, yet simple, alternative to ivy
(require 'prelude-company)
(require 'prelude-key-chord) ;; Binds useful features to key combinations
(require 'prelude-org)
(require 'prelude-c)
(require 'prelude-css)
(require 'prelude-emacs-lisp)
(require 'prelude-js)
;; (require 'prelude-latex)
(require 'prelude-lisp) ;; Common setup for Lisp-like languages
(require 'prelude-lsp) ;; Base setup for the Language Server Protocol
(require 'prelude-perl)
(require 'prelude-python)
(require 'prelude-ruby)
(require 'prelude-shell)
(require 'prelude-scss)
(require 'prelude-web) ;; Emacs mode for web templates
(require 'prelude-xml)
(require 'prelude-yaml)

;; misc
(setq prelude-guru nil)
(blink-cursor-mode t)
;;(scroll-bar-mode -1)
(menu-bar-mode -1)
(set-display-table-slot standard-display-table 'wrap ?\ )
;; warn when opening files bigger than 50MB
(setq large-file-warning-threshold 50000000)
(setq flx-ido-threshhold 1000)
(setq fill-column 80)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching 't)

;; additional packages
(prelude-require-packages
 '(git-gutter+ escreen vlf lsp-java))

(global-set-key "\C-s" 'isearch-forward)
(global-git-gutter+-mode t)
(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

;; company (autocompletion)
(setq company-idle-delay .1)
(setq company-transformers
      '(company-sort-by-occurrence
        company-sort-by-backend-importance))
(delete 'company-etags company-backends)
(setq company-tooltip-flip-when-above t)

;; keybindings
(global-set-key [remap other-window] 'nil)
(define-key prelude-mode-map (kbd "C-c f") 'projectile-find-file)
(define-key prelude-mode-map (kbd "C-M-o") 'crux-smart-open-line-above)
(define-key prelude-mode-map (kbd "C-M-j") 'crux-top-join-line)

;; auto balance my windows
(defadvice split-window-right (after restore-balanace-below activate)
  (balance-windows))
(defadvice delete-window (after restore-balance activate)
  (balance-windows))
(setq split-height-threshold nil) ;; split windows vertically

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
(setq jsx-indent-level 2)

;; golang
(add-hook 'go-mode-hook
  (lambda ()
    (setq-default)
    (setq tab-width 2)
    (setq standard-indent 2)
    (setq indent-tabs-mode nil)))

;; sh
(setq sh-basic-offset 2)
(setq sh-indentation 2)

;; html
(setq web-mode-markup-indent-offset 2)

;; emmet
(add-hook 'sgml-mode-hook 'emmet-mode)

;; language
(setq ispell-dictionary "en")

;; dired
(defun dired-no-details ()
  "To be run as hook for `dired-mode'."
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'dired-no-details)

;; latex
(defun latex-whitespace ()
  "Disable whitespace mode for latex."
  (set (make-local-variable 'whitespace-line-column) 90)
  (whitespace-mode -1)
  (whitespace-mode +1)
  (set-fill-column 90))
(add-hook 'LaTeX-mode-hook 'latex-whitespace)

;; terraform
(add-hook 'terraform-mode 'lsp-mode)

;; nice shortcuts
(defun projectile-escreen-ag ()
  "Run projectiles search in a new screen."
  (interactive
   (progn (escreen-create-screen-dim)
          (crux-switch-to-previous-buffer)
          (call-interactively 'projectile-ag)))
  )

(define-key prelude-mode-map (kbd "C-c s") 'projectile-escreen-ag)

(defun write-buffer-file-to-tmux-buffer ()
  "Copy buffer file name to the next tmux pane."
  (interactive)
  (let ((fn (concat "$(dir=$PWD; echo " (buffer-file-name) " | sed \"s/${dir//\\//\\\\/}/\./g\")")))
    (progn
      (shell-command "tmux select-pane -t :.+")
      (shell-command (concat "tmux send-keys " (shell-quote-argument fn)))
      (shell-command (concat "tmux send-keys " (shell-quote-argument "\t")))
      )))

(define-key prelude-mode-map (kbd "C-x t") 'write-buffer-file-to-tmux-buffer)


;; java

(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)


;;; personal.el ends here
