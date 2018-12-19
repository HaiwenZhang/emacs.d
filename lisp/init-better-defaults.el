
;; Disable backup files
(setq make-backup-files nil) ;; stop creating backup~ files
(setq auto-save-default nil) ;; stop creating #autosave# files
;; 简化yes和no
(fset 'yes-or-no-p 'y-or-n-p)

(when *is-a-mac*
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (setq ns-use-proxy-icon  nil)
  (setq frame-title-format nil))

;; (when *is-a-mac*
;;   (add-to-list 'default-frame-alist '(fullscreen . maximized)))

(use-package which-key
  :ensure t 
  :config
  (which-key-mode))

;;  Undo tree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(use-package all-the-icons
  :ensure t)

(use-package windresize
  :ensure t
  :config (global-set-key (kbd "C-c m") 'windresize))


;;;windmove-mode
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings)
  (global-set-key (kbd "C-c j")  'windmove-left)
  (global-set-key (kbd "C-c l") 'windmove-right)
  (global-set-key (kbd "C-c i")    'windmove-up)
  (global-set-key (kbd "C-c k")  'windmove-down))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config 
  ;; (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :init
  (dumb-jump-mode)
  :ensure
  )

(use-package autoinsert
  :ensure t
  :config
  (setq auto-insert-query nil)
  (setq auto-insert-directory (locate-user-emacs-file "template"))
  (add-hook 'find-file-hook 'auto-insert)
  (auto-insert-mode t))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Emacs, Haiwen!")
  )

(provide 'init-better-defaults)
