(use-package json-mode
  :ensure t)

(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode)
	 ("\\.js\\'" . js2-jsx-mode)
         ("\\.jsx\\'" . js2-jsx-mode))
  :interpreter (("node" . js2-mode)
                ("node" . js2-jsx-mode))
  :hook ((js2-mode . js2-imenu-extras-mode)
         (js2-mode . js2-highlight-unused-variables-mode))
  :config
  (use-package js2-refactor
    :diminish js2-refactor-mode
    :hook (js2-mode . js2-refactor-mode)
    :config (js2r-add-keybindings-with-prefix "C-c C-m")))
(provide 'init-js)
