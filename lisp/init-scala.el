(use-package scala-mode
  :ensure t
  :interpreter
  ("scala" . scala-mode))

(use-package ensime
  :ensure t
  :config
  (setq ensime-startup-notification nil))

(provide 'init-scala)
