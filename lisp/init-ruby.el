(use-package rvm
  :ensure t
  :config
  (rvm-use-default))

(use-package ruby-hash-syntax
  :ensure t)


(use-package robe
  :ensure t)

(add-hook 'ruby-mode-hook 'robe-mode)
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))
(eval-after-load 'company
  '(push 'company-robe company-backends))

(use-package rinari
  :ensure t
  :config
  (global-rinari-mode))

(defun update-rails-ctags ()
  (interactive)
  (let ((default-directory (or (rinari-root) default-directory)))
    (shell-command (concat "ctags -a -e -f " rinari-tags-file-name " --tag-relative -R app lib vendor test"))))

(use-package projectile-rails
  :ensure t
  :config
  (progn
    (eval-after-load 'projectile
      (add-hook 'projectile-mode-hook 'projectile-rails-on))))



(provide 'init-ruby)
