(use-package web-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (setq web-mode-ac-sources-alist
	  '(("css" . (ac-source-css-property))
	    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
    (setq web-mode-enable-auto-closing t)
    (setq web-mode-enable-auto-quoting t))) ; this fixes the quote problem I mentioned

(use-package emmet-mode
  :ensure t
  :config
  (progn
    (add-hook 'web-mode-hook 'emmet-mode)
    (add-hook 'css-mode-hook 'emmet-mode)))
	

(provide 'init-web)
