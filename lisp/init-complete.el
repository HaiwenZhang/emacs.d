

(use-package company
  :diminish 
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :bind (("M-/" . company-complete)
         ("C-M-i" . company-complete)
         :map company-mode-map
         ("<backtab>" . company-yasnippet)
         :map company-active-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next)
         ("<tab>" . company-complete-common-or-cycle)
         ("<backtab>" . my-company-yasnippet)
         :map company-search-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next))
  :hook (prog-mode . company-mode)
  :config (setq company-tooltip-align-annotations t company-idle-delay 0.1 company-echo-delay 0
              company-minimum-prefix-length 2 company-require-match nil company-dabbrev-ignore-case
              nil company-dabbrev-downcase nil company-show-numbers t)

  )


;; 人工智能代码补全

(use-package company-tabnine
  :ensure t
  :after 'company-mode
  'company-tabnine-mode
  :config (add-to-list 'company-backends #'company-tabnine)
  )



;; 美化company
(use-package company-box 
  :hook (company-mode . company-box-mode))

;; 代码片段

(use-package yasnippet
  :defer 2
  :config (setq yas-snippet-dirs ' ("~/.emacs.d/snippets")))

(provide 'init-complete)
