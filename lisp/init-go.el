


;; Go packages:
;; go get -u github.com/mdempsky/gocode # github.com/nsf/gocode
;; go get -u github.com/rogpeppe/godef
;; go get -u golang.org/x/tools/cmd/goimports
;; go get -u golang.org/x/tools/cmd/guru
;; go get -u golang.org/x/tools/cmd/gorename
;; go get -u golang.org/x/tools/cmd/gotype
;; go get -u golang.org/x/tools/cmd/godoc
;; go get -u github.com/derekparker/delve/cmd/dlv
;; go get -u github.com/josharian/impl
;; go get -u github.com/cweill/gotests/...
;; go get -u github.com/fatih/gomodifytags
;; go get -u github.com/davidrjenni/reftools/cmd/fillstruct


;; Golang
(use-package go-mode
  :ensure t
  :bind (:map go-mode-map
              ([remap xref-find-definitions] . godef-jump)
              ("C-c R" . go-remove-unused-imports)
              ("<f1>" . godoc-at-point))
  :config
  (use-package go-rename
    :ensure t)
  (use-package golint
    :ensure t)
  (use-package govet
    :ensure t)

  (use-package go-tag
    :ensure t
    :bind (:map go-mode-map
                ("C-c t" . go-tag-add)
                ("C-c T" . go-tag-remove))
    :config (setq go-tag-args (list "-transform" "camelcase")))

  (use-package gotest
    :ensure t
    :bind (:map go-mode-map
                ("C-c a" . go-test-current-project)
                ("C-c m" . go-test-current-file)
                ("C-c ." . go-test-current-test)
                ("C-c x" . go-run)))

  (use-package go-gen-test
    :ensure t
    :bind (:map go-mode-map
                ("C-c C-t" . go-gen-test-dwim)))

  ;; LSP provides the functionalities.
  ;; NOTE: `go-langserver' doesn't support Windows so far.
  (unless centaur-lsp
    ;; `goimports' or `gofmt'
    (setq gofmt-command "goimports")
    ;; (add-hook 'before-save-hook #'gofmt-before-save)

    ;; Go add-ons for Projectile
    ;; Run: M-x `go-projectile-install-tools'
    (with-eval-after-load 'projectile
      (use-package go-projectile
	:ensure t
        :commands (go-projectile-mode go-projectile-switch-project)
        :hook ((go-mode . go-projectile-mode)
               (projectile-after-switch-project . go-projectile-switch-project))))

    (use-package go-eldoc
      :ensure t
      :hook (go-mode . go-eldoc-setup))

    (use-package go-guru
      :ensure t
      :bind (:map go-mode-map
                  ;; ([remap xref-find-definitions] . go-guru-definition)
                  ([remap xref-find-references] . go-guru-referrers)))

    (with-eval-after-load 'company
      (use-package company-go
	:ensure t
        :defines company-backends
        :init (cl-pushnew 'company-go company-backends)))))

;; Local Golang playground for short snippes
(use-package go-playground
  :ensure t
  :diminish go-playground-mode
  :commands go-playground-mode)


;; (use-package go-mode
;;   :ensure t
;;   :mode (("\\.go\\'" . go-mode))
;;   :hook ((before-save . gofmt-before-save))
;;   :config
;;   (setq gofmt-command "goimports")
;;   (use-package company-go
;;     :ensure t
;;     :config
;;     (add-hook 'go-mode-hook (lambda()
;; 			      (add-to-list (make-local-variable 'company-backends))
;; 			      (setq tab-width 2)
;; 			      (setq indent-tabs-mode 1)))))



;; (use-package go-eldoc
;;   :ensure t
;;   :hook (go-mode . go-eldoc-setup))

;; (use-package go-guru
;;   :ensure t
;;   :hook (go-mode . go-guru-hl-identifier-mode))

;; (use-package go-rename
;;   :ensure t)

(provide 'init-go)
