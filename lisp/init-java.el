;;; init-java.el ---                                 -*- lexical-binding: t; -*-

;; Copyright (C) 2018  haiwen

;; Author: haiwen <haiwen@haiwens-MacBook-Pro.local>
;; Keywords: java


;; Java support
;; Install: wget http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
;;          tar jdt-language-server-latest.tar.gz -C ~/.emacs.d/eclipse.jdt.ls/server/

(use-package lsp-java
  :ensure t
  :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java
  :after (lsp-java))
(use-package lsp-java-treemacs
  :after (treemacs))

(provide 'init-java)
