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

(provide 'init-better-defaults)
