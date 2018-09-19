;; (use-package ruby-mode
;;   :ensure t
;;   :mode "\\.\\(rb\\|rake\\|\\gemspec\\|ru\\|\\(Rake\\|Gem\\|Guard\\|Cap\\|Vagrant\\)file\\)$")



;; (use-package robe
;;   :ensure t
;;   :config
;;   (eval-after-load 'company
;;     '(push 'company-robe company-backends)))

;; (use-package ruby-refactor
;;   :ensure t
;;   :diminish ruby-refactor-mode
;;   :init (add-hook 'ruby-mode-hook #'ruby-refactor-mode-launch))

;; (use-package ruby-hash-syntax
;;   :ensure t)

;; ;; Run a Ruby process in a buffer
;; (use-package inf-ruby
;;   :ensure t
;;   :init
;;   (add-hook 'ruby-mode-hook #'inf-ruby-minor-mode)
;;   (add-hook 'compilation-filter-hook #'inf-ruby-auto-enter))


(provide 'init-ruby)
