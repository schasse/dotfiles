;;; personal-escreen.el --- personal configuration of escreen
;;
;; copied from Vinh Nguyen
;; URL: http://blog.nguyenvq.com/2011/03/07/escreen-instead-of-elscreen-for-screen-like-features-in-emacs/

;;; Commentary:

;; escreen is simpler than elscreen...but elscreen spawns new 0-9 set of screens
;; for a new frame whereas escreen does not it is better than elscreen because:
;; elscreen has issues when using with emacsclient -c (does not always create new frame, messes up existing frame); in escreen, each screen has its own ring of recently visited files (good!)
;; http://blog.tapoueh.org/news.dim.html#%20Escreen%20integration
;; http://www.splode.com/~friedman/software/emacs-lisp/#ui

;;; Code:

(load "escreen")
(escreen-install)
(setq escreen-prefix-char "\C-z") ;; http://www.macs.hw.ac.uk/~hwloidl/cool-el.html
(global-set-key escreen-prefix-char 'escreen-prefix)
;; add C-\ l to list screens with emphase for current one
(defun escreen-get-active-screen-numbers-with-emphasis ()
 "what the name says"
 (interactive)
 (let ((escreens (escreen-get-active-screen-numbers))
 (emphased ""))

 (dolist (s escreens)
 (setq emphased
 (concat emphased (if (= escreen-current-screen-number s)
 (propertize (number-to-string s)
 ;;'face 'custom-variable-tag) " ")
 'face 'info-title-3)
 ;;'face 'font-lock-warning-face)
 ;;'face 'secondary-selection)
 (number-to-string s))
 " ")))
 (message "escreen: active screens: %s" emphased)))

(global-set-key (kbd "C-\\ l") 'escreen-get-active-screen-numbers-with-emphasis)

(defun escreen-goto-last-screen-dim ()
 (interactive)
 (escreen-goto-last-screen)
 (escreen-get-active-screen-numbers-with-emphasis))

(defun escreen-goto-prev-screen-dim (&optional n)
 (interactive "p")
 (escreen-goto-prev-screen n)
 (escreen-get-active-screen-numbers-with-emphasis))

(defun escreen-goto-next-screen-dim (&optional n)
 (interactive "p")
 (escreen-goto-next-screen n)
 (escreen-get-active-screen-numbers-with-emphasis))

(define-key escreen-map escreen-prefix-char 'escreen-goto-last-screen-dim)

(defun escreen-create-screen-dim ()
 (interactive)
 (escreen-create-screen)
 (escreen-get-active-screen-numbers-with-emphasis))

(defun escreen-kill-screen-dim ()
 (interactive)
 (escreen-kill-screen)
 (escreen-get-active-screen-numbers-with-emphasis))

(add-hook 'escreen-goto-screen-hook 'escreen-get-active-screen-numbers-with-emphasis)

(define-key escreen-map "c" 'escreen-create-screen-dim)
(define-key escreen-map "k" 'escreen-kill-screen-dim)

;; (global-set-key (kbd "C-]") 'escreen-goto-next-screen)
;; (keyboard-translate ?\C-[ ?\H-[)
;; (global-set-key (kbd "H-[") 'escreen-goto-prev-screen)
(global-set-key (kbd "C-]") 'escreen-goto-next-screen-dim)
(keyboard-translate ?\C-[ ?\H-[)
(global-set-key (kbd "H-[") 'escreen-goto-prev-screen-dim)

;;; personal-escreen.el ends here
