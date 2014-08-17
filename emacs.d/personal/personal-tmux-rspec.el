;;; personal-tmux-rspec.el --- rspec with tmux

;;; Commentary:
;; overrides rspec-compile to use it with tmux

;;; Code:
(setq personal-tmux-rspec-enabled nil)
(setq personal-tmux-session-name 0)
(setq personal-tmux-window-name 0)
(setq personal-tmux-pane-number 1)

(defun personal-tmux-rspec-verify-single ()
  "Runs rspec-verify-single command but in tmux"
  (interactive)
  (setq personal-tmux-rspec-enabled t)
  (rspec-verify-single))

(defun personal-rspec-verify-single ()
  "Runs rspec-verify-single command"
  (interactive)
  (setq personal-tmux-rspec-enabled nil)
  (rspec-verify-single))

(defun personal-tmux-exec (command)
  "Execute command in tmux pane"
  (interactive)
  (shell-command
   (format "tmux send-keys -t %s:%s.%s '%s' Enter"
           personal-tmux-session-name
           personal-tmux-window-name
           personal-tmux-pane-number
           command)))

(defun personal-tmux-setup (x y z)
  "Setup global variables for tmux session, window, and pane"
  (interactive "sEnter tmux session name: \nsEnter tmux window name: \nsEnter tmux pane number: ")
  (setq personal-tmux-session-name x)
  (setq personal-tmux-window-name y)
  (setq personal-tmux-pane-number z)
  (message "Tmux Setup, session name: %s, window name: %s, pane number: %s"
           personal-tmux-session-name
           personal-tmux-window-name
           personal-tmux-pane-number))

(defun rspec-compile (target &optional opts)
  "Override this to enable using tmux. Runs a compile for TARGET with the
specified options."
  (setq rspec-last-directory default-directory
        rspec-last-arguments (list target opts))

  (if rspec-use-rvm
      (rvm-activate-corresponding-ruby))

  (let ((default-directory (or (rspec-project-root) default-directory))
        (compilation-scroll-output t))
    (if personal-tmux-rspec-enabled
        (personal-tmux-exec (mapconcat 'identity `(,(rspec-runner)
                                                   ,(rspec-runner-options opts)
                                                   ,target) " "))
      (compile (mapconcat 'identity `(,(rspec-runner)
                                        ,(rspec-runner-options opts)
                                        ,target) " ")
                 'rspec-compilation-mode))))
;;; personal-tmux-rspec.el ends here
