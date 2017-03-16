;; close back up file 
(setq make-backup-files nil)
;; 简化yes和no
(fset 'yes-or-no-p 'y-or-n-p)

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

(use-package neotree
  :ensure t
  :bind ("<f8>" . neotree-toggle)
  :config (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(provide 'init-better-defaults)
