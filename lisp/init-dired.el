(use-package diredful
  :ensure t
  :config
  (diredful-mode 1))

(use-package dired-icon
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'dired-icon-mode))

(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-dired)
