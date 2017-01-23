(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package company-anaconda
  :ensure t
  :config
  (progn
    (add-hook 'python-mode-hook
	      (lambda ()
		(set (make-local-variable 'company-backends) '(company-anaconda company-dabbrev))))
    ))

(provide 'init-python)
