
;;; init-treemacs.el

;; Copyright (C) 2018  haiwen

;; Author: haiwen <haiwensummer@gmail.com>
;; Keywords: lisp

(use-package treemacs
  :ensure t
  :defer t
  :commands (treemacs-follow-mode
             treemacs-filewatch-mode
             treemacs-fringe-indicator-mode
             treemacs-git-mode)
  :bind (([f8]        . treemacs)
         ("C-`"       . treemacs-select-window)
         ("M-0"       . treemacs-select-window)
         ("C-x 1"     . treemacs-delete-other-windows)
         ("C-x t 1"   . treemacs-delete-other-windows)
         ("C-x t b"   . treemacs-bookmark)
         ("C-x t C-t" . treemacs-find-file)
         ("C-x t M-t" . treemacs-find-tag)
         :map treemacs-mode-map
         ([mouse-1]   . treemacs-single-click-expand-action))
  :init
  
  :config
  (setq treemacs-follow-after-init          t
        treemacs-width                      35
        treemacs-indentation                2
        treemacs-git-integration            t
        treemacs-collapse-dirs              3
        treemacs-silent-refresh             nil
        treemacs-change-root-without-asking nil
        treemacs-sorting                    'alphabetic-desc
        treemacs-show-hidden-files          t
        treemacs-never-persist              nil
        treemacs-is-never-other-window      nil
        treemacs-goto-tag-strategy          'refetch-index)
  
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t))

;; Projectile integration for treemacs
(use-package treemacs-projectile
  :ensure t
  :after projectile
  :bind (([f9] . treemacs-projectile)
         :map projectile-command-map
         ("h" . treemacs-projectile)))

(provide 'init-treemacs)
