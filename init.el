;; init.el --- my custom setup

;;; Commentary:

;;; code:
(load "~/.emacs.d/init/custom")
(load "~/.emacs.d/init/functions")
(load "~/.emacs.d/init/keys")
(load "~/.emacs.d/init/packages")

(defconst base-path (file-name-directory load-file-name))

;; bring in use-package
(require 'use-package)

;; rainbow delimters
(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; projectile
(use-package projectile
  :ensure t
  :config (projectile-global-mode))

;; jpop
(use-package jpop
  :load-path "packages/jpop"
  :config
  (jpop-global-mode)
  (add-hook 'jpop-toggle-test-fallback-hook 'jpop-find-test)
  :bind
  ([C-tab] . jpop-find-file)
  ("C-S-<tab>" . jpop-git-find-file)
  ("C-x p f c" . jpop-change-and-find-file)
  ("<f8>" . jpop-change)
  ("C-x C-b" . jpop-switch-buffer)
  ("C-x C-p" . jpop-switch-and-find-file))

;; appearance
(global-linum-mode 1)
(add-to-list 'custom-theme-load-path (concat base-path "/themes"))
(load-theme 'aurora t)

;; context colouring
(use-package context-coloring
  :ensure t
  :defer t
  :config (advice-add 'load-theme :requires
                      '(lambda (&rest args) (context-coloring-mode 0))))

;; drag lines up and down
(use-package drag-stuff
  :ensure t
  :config (drag-stuff-global-mode 1)
  :bind ("<M-S-down>" . drag-stuff-down)
        ("<M-S-up>" . drag-stuff-up))

;; autocomplete minibuffer
(use-package ivy
  :init (ivy-mode)
          (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  :bind ("C-c C-r" . ivy-resume)
  ("C-s" . swiper)
  :config
  (bind-keys :map ivy-minibuffer-map
	     ("RET" . ivy-alt-done)))

(use-package counsel
  :ensure t
  :requires ivy
  :bind ("M-x" . counsel-M-x)
        ("C-x C-f" . counsel-find-file))

(use-package smex
  :ensure t
  :config (smex-initialize)
  :bind ("M-x" . smex)
        ("M-X" . smex-major-mode-commands)
        ("C-c M-x" . execute-extended-command))

;; autocomplete editor
(use-package auto-complete
  :ensure t
  :config (ac-config-default))

(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))

;;use-package powerline
;;  :init
;;  (powerline-default-theme))

;; web-mode
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode)))

(use-package js2-mode
  :ensure t
  :config
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package jsx-mode
  :ensure t
  :config
    (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode)))

;; docker-mode
(use-package docker
  :config (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

;; neo-tree
(use-package neotree
  :ensure t
  :config (setq neo-smart-open t)
  :bind ("<f1>" . neotree-toggle))

;; flycheck
(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

;; popwin
(use-package popwin
  :ensure t
  :config (popwin-mode 1))

;; sass-mode
(use-package sass-mode
  :ensure t
  :init
  (setq exec-path (cons (expand-file-name "~/.rvm/gems/ruby-2.0.0-p481/bin/sass") exec-path))
  (autoload 'scss-mode "scss-mode")
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode)))

;; magit
(use-package magit
  :ensure t
  :defer t
  :config (bind-keys :map magit-mode-map
                     ("o" . magit-open-file-other-window)
                     ("C-c c" . magit-whitespace-cleanup)
                     ("C-c e" . magit-vc-ediff)
                     ("C-<tab>" . jpop-find-file)))

(add-hook 'magit-mode-hook 'image-minor-mode)

;; better redo/undo
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode 1)
  (defalias 'redo 'undo-tree-redo)
  :bind ("s-z" . undo)
  ("s-Z" . redo))

;; multi line edit
(use-package multiple-cursors
  :ensure t
  :bind ("M-<down>" . mc/mark-next-like-this)
  ("M-<up>" . mc/mark-previous-like-this))

;; misc
(setq tab-width 2) ; Default tab-width
(add-hook 'focus-out-hook 'save-all) ; Auto-saving when losing focus
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(setq-default cursor-type 'bar)             ; Change cursor to bar
(setq frame-title-format "Dr. Ian Malcolm: God help us, we're in the hands of engineers.")
(scroll-bar-mode -1)
(delete-selection-mode 1) ; Deleting selected text if typed in/pasted
(fset 'yes-or-no-p 'y-or-n-p) ; Use y or n instead of yes or no
(setq make-backup-files nil) ; Preventing backup (~) files
(show-paren-mode 1) ; Always show matching parenthesis
(desktop-save-mode 1) ; Restore files on startup

;; diff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function (quote split-window-horizontally))
(setq ediff-keep-variants nil)


(provide 'init)
;;; init.el ends here
