
(use-package py-autopep8
  :ensure t
  :hook ((python-mode . py-autopep8-enable-on-save)))

;; (use-package company-jedi
;;   :ensure t
;;   :config
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (add-hook 'python-mode-hook (lambda ()
;;                                 (add-to-list (make-local-variable 'company-backends) 'company-jedi))))
;;

(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package company-anaconda
  :ensure t
  :config
  (add-hook 'python-mode-hook (lambda ()
				(add-to-list (make-local-variable 'company-backends) 'company-anaconda))))

(provide 'init-python)
