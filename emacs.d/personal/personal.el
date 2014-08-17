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
(setq flx-ido-threshhold 2000)

;; additional packages
(prelude-require-packages
 '(git-gutter+ escreen rvm robe bundler rspec-mode
   ido-vertical-mode ess vlf multiple-cursors))

(ido-vertical-mode 1)
(global-git-gutter+-mode t)
(add-to-list 'mc/unsupported-minor-modes 'smartparens-mode)

;; company (autocompletion)
(setq company-idle-delay nil)

;; keybindings
(global-set-key [remap other-window] 'nil)
(define-key prelude-mode-map (kbd "C-c f") 'projectile-find-file)
(define-key prelude-mode-map (kbd "C-M-o") 'prelude-smart-open-line-above)
(define-key prelude-mode-map (kbd "C-M-j") 'prelude-top-join-line)
(define-key prelude-mode-map (kbd "C-M-e") 'er/expand-region)
(define-key prelude-mode-map (kbd "M-/") 'company-manual-begin)
(key-chord-define-global "vv" 'rspec-verify-single)
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

;; rspec
(defun my-rspec-verify-single ()
  "Runs rspec-verify-single command but in tmux"
  (interactive)
  (tmux-exec (my-command)))

(defun my-target ()
  (rspec-runner-target
   (cons
    (rspec-spec-file-for (buffer-file-name))
    (save-restriction
      (widen)
      (number-to-string (line-number-at-pos))))))

(defun my-opts ()
  (rspec-core-options))

(defun my-command ()
  (mapconcat 'identity `(,(rspec-runner)
                         ,(rspec-runner-options (my-opts))
                         ,(my-target)) " "))

(setq tmux-session-name 0)
(setq tmux-window-name 1)
(setq tmux-pane-number 1)

(defun tmux-exec (command)
  "Execute command in tmux pane"
  (interactive)
  (shell-command
   (format "tmux send-keys -t %s:%s.%s '%s' Enter" tmux-session-name tmux-window-name tmux-pane-number command)))

(defun tmux-setup (x y z)
  "Setup global variables for tmux session, window, and pane"
  (interactive "sEnter tmux session name: \nsEnter tmux window name: \nsEnter tmux pane number: ")
  (setq tmux-session-name x)
  (setq tmux-window-name y)
  (setq tmux-pane-number z)
  (message "Tmux Setup, session name: %s, window name: %s, pane number: %s" tmux-session-name tmux-window-name tmux-pane-number))

(defun rspec-compile (target &optional opts)
  "Override this to enable using tmux. Runs a compile for TARGET with the
specified options."
  (setq rspec-last-directory default-directory
        rspec-last-arguments (list target opts))

  (if rspec-use-rvm
      (rvm-activate-corresponding-ruby))

  (let ((default-directory (or (rspec-project-root) default-directory))
        (compilation-scroll-output t))
    (if rspec-tmux-mode
        (compile (mapconcat 'identity `(,(rspec-runner)
                                        ,(rspec-runner-options opts)
                                        ,target) " ")
                 'rspec-compilation-mode)
        (tmux-exec (mapconcat 'identity `(,(rspec-runner)
                                          ,(rspec-runner-options opts)
                                          ,target) " ")))))

;;; personal.el ends here
