(setq company-backends (delete 'company-semantic company-backends))

(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers))

(provide 'init-cpp)
