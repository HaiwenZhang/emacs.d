(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" "\\.vue\\'" "\\.jsx\\'")
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-css-colorization t)
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "royalblue")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "powderblue")
  (set-face-attribute 'web-mode-doctype-face nil :foreground "lightskyblue")   
  (use-package company-web
    :ensure t
    :config
    (add-hook 'web-mode-hook (lambda()
			       (add-to-list (make-local-variable 'company-backends) 'company-web)))
    (add-hook 'web-mode-hook (lambda ()
                               (when (equal web-mode-content-type "html")
				 (my/web-html-setup))))))

(defun my/web-html-setup ()
  ;; web html mode specific setup
  (flycheck-add-mode 'html-tidy 'web-mode)
  (flycheck-select-checker 'html-tidy)
  (flycheck-mode))

(use-package css-mode
  :ensure t
  :mode "\\.css\\'"
  :config
  (setq-default css-indent-offset 2)
  ;; (setq flycheck-stylelintrc "~/.stylelintrc")
  (setq-default css-indent-offset 2)
  (add-to-list (make-local-variable 'company-backends)
               '(company-css company-files company-capf company-dabbrev)))

(use-package scss-mode
  :ensure t
  :mode ("\\.scss\\'" "\\.sass\\'"))

(use-package emmet-mode
  :ensure t
  :hook (web-mode sgml-mode css-mode scss-mode js2-mode rjsx-mode)
  :config
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil))))

(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode)
         ("\\.json\\'" . javascript-mode))
  :init
  (setq-default js2-basic-offset 2)
  (setq-default js2-global-externs '("module" "require" "assert" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__d\
irname" "console" "JSON")))

(use-package rjsx-mode
  :ensure t
  :mode ("\\.js\\'")
  :config
  (setq js2-basic-offset 2)
  (add-hook 'rjsx-mode-hook (lambda()
                              (flycheck-add-mode 'javascript-eslint 'rjsx-mode)
                              (my/use-eslint-from-node-modules)
                              (flycheck-select-checker 'javascript-eslint)
                              )))

(use-package mode-local
  :ensure t
  :config
  (setq-mode-local rjsx-mode emmet-expand-jsx-className? t)
  (setq-mode-local web-mode emmet-expand-jsx-className? nil))

(use-package react-snippets
  :ensure t)

(provide 'init-web)
