(use-package go-mode
  :ensure t
  :mode (("\\.go\\'" . go-mode))
  :hook ((before-save . gofmt-before-save))
  :config
  (setq gofmt-command "goimports")
  (use-package company-go
    :ensure t
    :config
    (add-hook 'go-mode-hook (lambda()
			      (add-to-list (make-local-variable 'company-backends)))))
  )
(use-package go-eldoc
  :ensure t
  :hook (go-mode . go-eldoc-setup))

(use-package go-guru
  :ensure t
  :hook (go-mode . go-guru-hl-identifier-mode))

(use-package go-rename
  :ensure t)

(provide 'init-go)
