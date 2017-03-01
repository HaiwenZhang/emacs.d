(use-package rvm
  :ensure
  :config
  (rvm-use-default)
  )

(use-package robe
  :ensure
  :config
  (progn
    (add-hook 'ruby-mode-hook 'robe-mode)
    (eval-after-load 'company
      '(push 'company-robe company-backends))
    (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
      (rvm-activate-corresponding-ruby))
    ))


(use-package ruby-hash-syntax
  :ensure t)

(provide 'init-ruby)
