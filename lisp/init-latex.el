

(use-package auctex)

(add-hook 'LaTeX-mode-hook 
  (lambda()
  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
  (setq TeX-command-default "XeLaTeX")
  (setq TeX-save-querynil )
  (setq TeX-show-compilation t)
))



(use-package company-auctex
  :defer t
  :init
  (company-auctex-init))

(use-package company-math
  :defer t
  :init
  (add-to-list 'company-backends 'company-math-symbols-unicode))

(provide 'init-latex)
