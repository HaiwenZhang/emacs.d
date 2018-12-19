;;; init-projectile.el ---                              -*- lexical-binding: t; -*-

;; Copyright (C) 2018  haiwen

;; Author: haiwen <haiwen@Haiwens-MBP.lan>
;; Keywords: emacs config

(use-package projectile
  :ensure t
  :demand
  :init (setq projectile-use-git-grep t)
  :bind (("C-c p f" . projectile--find-file))
  :config
  (progn
    (projectile-global-mode 1)
    (setq projectile-enable-caching t)
    (setq projectile-require-project-root nil)
    (setq projectile-completion-system 'ivy)
    (add-to-list 'projectile-globally-ignored-files ".DS_Store")))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode 1))

(provide 'init-projectile)
