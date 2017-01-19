(use-package ruby-mode
  :ensure t
  :config
  (progn
    (use-package rvm
      :ensure t
      :init (rvm-use-default)
      :config (setq rvm-verbose nil))
    (use-package ruby-tools
      :ensure t)
    (use-package rspec-mode
      :ensure t
      :config
      (progn
        (add-hook 'compilation-mode-hook
                  (lambda ()
                    (when (eq major-mode 'rspec-compilation-mode)
                      (setq compilation-scroll-output t)
                      (local-set-key (kbd "g") (lambda () (interactive) (rspec-rerun))))))
        (setq rspec-use-rvm t)
        (setq rspec-use-rake-when-possible nil)
        (defadvice rspec-compile (around rspec-compile-around activate)
          "Use BASH shell for running the specs because of ZSH issues."
          (let ((shell-file-name "/bin/bash"))
            ad-do-it))))
    (setq ruby-align-to-stmt-keywords '(begin if while unless until case for def))
    (setq ruby-insert-encoding-magic-comment nil)
    (setq ruby-deep-indent-paren nil))
  :bind (("C-M-h" . backward-kill-word)
         ("C-M-n" . scroll-up-five)
         ("C-M-p" . scroll-down-five))
  :mode (("\\.rake$" . ruby-mode)
         ("\\.gemspec$" . ruby-mode)
         ("\\.ru$" . ruby-mode)
         ("Rakefile$" . ruby-mode)
         ("Gemfile$" . ruby-mode)
         ("Capfile$" . ruby-mode)
         ("Guardfile$" . ruby-mode)
	 ))

(use-package ruby-hash-syntax
  :ensure t)

(provide 'init-ruby)
