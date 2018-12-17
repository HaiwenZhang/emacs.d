


;;; init-lsp.el ---                                  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  haiwen

;; Author: haiwen <haiwen@haiwens-MacBook-Pro.local>
;; Keywords: lsp


(use-package lsp-mode
  :ensure t
  :config
  (require 'lsp-clients)
  (add-hook 'python-mode-hook 'lsp))

(use-package lsp-ui
  :ensure t)
  ;; :config
  ;; (setq lsp-ui-doc-max-height 20
  ;; 	lsp-ui-doc-max-width 50
  ;; 	lsp-ui-sideline-ignore-duplicate t
  ;; 	lsp-ui-peek-always-show t))

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backend))

(provide 'init-lsp)
