(use-package python-mode
  :init (setq-default python-indent-offset 4
                      python-indent-guess-indent-offset-verbose nil))

;; (setq lsp-pyls-server-command '("/usr/local/bin/pyls"))

;; (setq lsp-clients-python-command "/usr/local/bin/pyls")


(provide 'init-python)
