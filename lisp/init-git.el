(use-package magit
  :ensure t
  :config
  (progn
    (setq magit-completing-read-function 'ivy-completing-read)
    (setq magit-branch-arguments nil))
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch-popup)
	 ("C-x M-l" . magit-log-buffer-file)
	 ))

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
