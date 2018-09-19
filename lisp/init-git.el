(use-package magit
  :ensure t
  :init
  (progn
    (bind-key "C-x g" 'magit-status))
  :config
  (use-package magit-todos
    :ensure t
    :config
    (magit-todos-mode)))

;; Walk through git revisions of a file
(use-package git-timemachine
  :bind (:map vc-prefix-map
              ("t" . git-timemachine)))

;;; Pop up last commit information of current line
(use-package git-messenger
  :commands git-messenger:copy-message
  :bind (:map vc-prefix-map
              ("p" . git-messenger:popup-message)
              :map git-messenger-map
              ("m" . git-messenger:copy-message))
  :init
  ;; Use magit-show-commit for showing status/diff commands
  (setq git-messenger:use-magit-popup t))

(use-package gitattributes-mode
  :ensure t)

(use-package gitconfig-mode
  :ensure t)

(use-package gitignore-mode
  :ensure t)

(provide 'init-git)
