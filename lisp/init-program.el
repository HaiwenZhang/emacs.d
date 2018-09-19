;;代码缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))
;;代码缩进快捷键
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; deletes all the whitespace when you hit backspace or delete
(use-package hungry-delete
  :ensure t
  :init
  (global-hungry-delete-mode))

(use-package expand-region
  :ensure t
  :bind("C-=" . er/expand-region))

(use-package smartparens
  :ensure t
  :config
  (use-package smartparens-config)
  (use-package smartparens-html)
  (use-package smartparens-python)
  (use-package smartparens-latex)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  :bind
  ( ("C-<down>" . sp-down-sexp)
    ("C-<up>"   . sp-up-sexp)
    ("M-<down>" . sp-backward-down-sexp)
    ("M-<up>"   . sp-backward-up-sexp)
    ("C-M-a" . sp-beginning-of-sexp)
    ("C-M-e" . sp-end-of-sexp)
    ("C-M-f" . sp-forward-sexp)
    ("C-M-b" . sp-backward-sexp)

    ("C-M-n" . sp-next-sexp)
    ("C-M-p" . sp-previous-sexp)

    ("C-S-f" . sp-forward-symbol)
    ("C-S-b" . sp-backward-symbol)

    ("C-<right>" . sp-forward-slurp-sexp)
    ("M-<right>" . sp-forward-barf-sexp)
    ("C-<left>"  . sp-backward-slurp-sexp)
    ("M-<left>"  . sp-backward-barf-sexp)

    ("C-M-t" . sp-transpose-sexp)
    ("C-M-k" . sp-kill-sexp)
    ("C-k"   . sp-kill-hybrid-sexp)
    ("M-k"   . sp-backward-kill-sexp)
    ("C-M-w" . sp-copy-sexp)

    ("C-M-d" . delete-sexp)

    ("M-<backspace>" . backward-kill-word)
    ("C-<backspace>" . sp-backward-kill-word)
    ([remap sp-backward-kill-word] . backward-kill-word)

    ("M-[" . sp-backward-unwrap-sexp)
    ("M-]" . sp-unwrap-sexp)

    ("C-x C-t" . sp-transpose-hybrid-sexp)

    ("C-c ("  . wrap-with-parens)
    ("C-c ["  . wrap-with-brackets)
    ("C-c {"  . wrap-with-braces)
    ("C-c '"  . wrap-with-single-quotes)
    ("C-c \"" . wrap-with-double-quotes)
    ("C-c _"  . wrap-with-underscores)
    ("C-c `"  . wrap-with-back-quotes)
    ))

(use-package popwin
  :ensure t
  :config (popwin-mode 1))

(use-package projectile
  :ensure t
  :config
  (progn
    (projectile-mode 1)
    (setq projectile-enable-caching t)
    (setq projectile-require-project-root nil)
    (setq projectile-completion-system 'ivy)
    (add-to-list 'projectile-globally-ignored-files ".DS_Store")))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode 1))

(provide 'init-program)
