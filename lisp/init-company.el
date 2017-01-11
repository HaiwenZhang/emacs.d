(require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)

(require-package 'company-flx)
(with-eval-after-load 'company
  (company-flx-mode +1))

(provide 'init-company)
