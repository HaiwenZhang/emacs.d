(use-package company
  :ensure t
  :config
  (global-company-mode t)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-backends
	'((company-files company-yasnippet company-keywords company-capf)
	  (company-abbrev company-dabbrev)))
  )

(add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (add-to-list (make-local-variable 'company-backends) 
              '(company-elisp))))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(advice-add 'company-complete-common :before (lambda () 
                                (setq my-company-point (point))))
(advice-add 'company-complete-common :after (lambda ()
                                (when (equal my-company-point (point))
                                  (yas-expand))))

(use-package company-box
 :ensure t
:hook (company-mode . company-box-mode))


(provide 'init-company)
