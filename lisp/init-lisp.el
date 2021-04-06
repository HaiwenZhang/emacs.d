(use-package lispy
  :hook
  (emacs-lisp-mode . (lambda () (lispy-mode 1)))
  (lisp-interaction-mode . (lambda ()(lispy-mode 1))))

(provide 'init-lisp)
