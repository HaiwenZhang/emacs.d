(use-package fullframe
  :ensure t)

(use-package magit
  :ensure t
  :init
  (progn
    (bind-key "C-x g" 'magit-status)
    ))

(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode +1))

(global-set-key (kbd "M-g M-g") 'hydra-git-gutter/body)


(use-package git-timemachine
  :ensure t
  )

(provide 'init-git)
