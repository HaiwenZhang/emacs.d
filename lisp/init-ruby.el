
;; 
(require-package 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(setq ruby-deep-indent-paren nil)

(require-package 'inf-ruby)
(global-set-key (kbd "C-c r r") 'inf-ruby)

(require-package 'rvm)
(global-set-key (kbd "C-c r a") 'rvm-activate-corresponding-ruby)


(require-package 'projectile)
(add-hook 'ruby-mode-hook 'projectile-on)

(require-package 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)


(require-package 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(provide 'init-ruby)
