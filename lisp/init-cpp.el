
;; (use-package ccls
;;   :ensure t
;;   :hook ((c-mode c++-mode objc-mode) .
;;          (lambda () (cl-pushnew #'company-lsp company-backends) (require 'ccls) (lsp))))

(provide 'init-cpp)
