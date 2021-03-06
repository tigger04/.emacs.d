;; cheatsheets.el --- my custom cheatsheets

;;; Commentary:

;; my custom setup available at `https://github.com/TimPerry/.emacs.d`

;;; code:

; os x
(setq mac-function-modifier 'hyper)
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

; app
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "<escape>") 'keyboard-quit)

; buffers
(global-set-key (kbd "s-{") 'previous-buffer)
(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-w") '(lambda () (interactive) (delete-window)))
(global-set-key (kbd "s-W") '(lambda () (interactive) (delete-frame)))
(global-set-key (kbd "s-T") '(lambda () (interactive) (make-frame)))
(global-set-key (kbd "s-t") '(lambda () (interactive) (split-window-right)))
(global-set-key (kbd "s-u") 'revert-buffer)
(global-set-key (kbd "s-s") 'save-buffer)

; nav
(global-set-key (kbd "H-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "H-<down>") 'end-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)

(global-set-key (kbd "H-<left>") 'beginning-of-line)
(global-set-key (kbd "s-<left>") 'beginning-of-line)
(global-set-key (kbd "s-<right>") 'end-of-line)
(global-set-key (kbd "H-<right>") 'end-of-line)

(global-set-key (kbd "M-S-<left>") 'select-backward-same-syntax)
(global-set-key (kbd "M-<left>") '(lambda () (interactive) (forward-same-syntax -1)))
(global-set-key (kbd "M-<right>") 'forward-same-syntax)

(global-set-key (kbd "s-l") 'goto-line)

(global-set-key (kbd "H-<backspace>") 'delete-char) 
(global-set-key (kbd "s-<backspace>") 'delete-current-line)
(global-set-key (read-kbd-macro "<M-DEL>") 'backward-delete-word)

(define-key global-map (kbd "<S-down-mouse-1>") 'mouse-save-then-kill)

; commenting
(global-set-key (kbd "s-/") 'dgc-comment)

; select, copy/paste
(global-set-key (kbd "s-c") 'pbcopy)
(global-set-key (kbd "s-v") 'pbpaste)
(global-set-key (kbd "s-V") 'counsel-yank-pop)
(global-set-key (kbd "s-x") 'pbcut)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-E") `enumerate-rectangle)

;magit
(define-key global-map (kbd "<f2>") 'magit-status)
(define-key global-map (kbd "<f3>") 'vc-ediff)
(define-key global-map (kbd "<f4>") 'magit-push)

;; misc
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)

;; toggle
(global-set-key (kbd "s-U") 'xah-toggle-letter-case)

;; Local Variables:
;; indent-tabs-mode: nil
;; eval: (add-hook 'after-save-hook '(lambda () (byte-compile-file (buffer-file-name))) nil t)
;; End:
;;; keys.el ends here
