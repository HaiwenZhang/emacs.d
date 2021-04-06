

(use-package major-mode-hydra
  :bind
  ("<f6>" . major-mode-hydra)
  :init
  (major-mode-hydra-define emacs-lisp-mode nil
    ("Basic"
     (
      ("n" (if (fboundp 'display-line-numbers-mode)
               (display-line-numbers-mode (if display-line-numbers-mode -1 1))
             (global-linum-mode (if global-linum-mode -1 1)))
       "line number"
       :toggle (or (bound-and-true-p display-line-numbers-mode) global-linum-mode)
       )
      )
   
     "Doc"
     (
      ("d" describe-foo-at-point "thing-at-pt")
      ("f" describe-function "function")
      ("v" describe-variable "variable")
      ("i" info-lookup-symbol "info lookup")))
    )
  )

(provide 'init-hydra)
