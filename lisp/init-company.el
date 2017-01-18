(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-flx
  :ensure t
  :config
  (progn
    (with-eval-after-load 'company
      (company-flx-mode +1))
    ))

(provide 'init-company)
