(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch-popup)
	 ("C-x M-l" . magit-log-buffer-file))
  :config
  (progn
    (setq magit-completing-read-function 'ivy-completing-read)
    (setq magit-branch-arguments nil)
    ))

(use-package fullframe
  :ensure t)

(with-eval-after-load 'magit
  (fullframe magit-status magit-mode-quit-window))

(use-package git-messenger
  :ensure t
  :bind ("C-x v p" . git-messenger:popup-buffer-hook))

(use-package magithub
  :after magit
  :config (magithub-feature-autoinject t))

(use-package git-gutter
  :ensure t
  :init (global-git-gutter-mode +1)
  :config
  (progn
    (custom-set-variables
     '(git-gutter:window-width 2)
     '(git-gutter:modified-sign "☁")
     '(git-gutter:added-sign "☀")
     '(git-gutter:deleted-sign "☂"))
    ))

(provide 'init-git)
