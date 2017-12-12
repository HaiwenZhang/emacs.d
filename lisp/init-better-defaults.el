;; close back up file 
(setq make-backup-files nil)
;; 简化yes和no
(fset 'yes-or-no-p 'y-or-n-p)

(when *is-a-mac*
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta))

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

;;;Winner-mode
;;可以使用 Ctrl-c ← （就是向左的箭头键）组合键，退回你的上一个窗口设置。）
;;可以使用 Ctrl-c → （前进一个窗口设置。）
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings))


;;;windmove-mode
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings)
    (global-set-key (kbd "C-c j")  'windmove-left)
    (global-set-key (kbd "C-c l") 'windmove-right)
    (global-set-key (kbd "C-c i")    'windmove-up)
    (global-set-key (kbd "C-c k")  'windmove-down))

;; (use-package neotree
;;   :ensure t
;;   :bind ("<f8>" . neotree-toggle)
;;   :config (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(provide 'init-better-defaults)
