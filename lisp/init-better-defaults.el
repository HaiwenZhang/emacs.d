;; 简化yes和no
(fset 'yes-or-no-p 'y-or-n-p)

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

(setq initial-scratch-message "\
;; Haiwen ♡ Emacs!")

;;  Undo tree
(require-package 'undo-tree)
(global-undo-tree-mode)

;; deletes all the whitespace when you hit backspace or delete
(require-package 'hungry-delete)
(global-hungry-delete-mode)

;; keep code nicely aligned
;;(require-package 'aggressive-indent)
;;(global-aggressive-indent-mode 1)

(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; smartparens config
(require-package 'smartparens)
(require 'smartparens-config)
(add-hook 'minibuffer-setup-hook 'turn-on-smartparens-strict-mode)
(smartparens-global-mode t)
;;; emacs lisp 中单引号不不全
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; rainbo-delimiters config
(require-package 'rainbow-delimiters)
(add-hook 'lisp-mode-hook
	  (lambda()
	    (rainbow-delimiters-mode)))

;; which key setting
(require-package 'which-key)
(which-key-mode)
(which-key-setup-side-window-bottom)

;; highlight surrounding parentheses
(require-package 'highlight-parentheses)
;;; Enables highlight-parentheses-mode on all buffers
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; windows management
(require-package 'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)

;;(require-package 'ace-jump-mode)
;;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; delete trailing whitespace befor save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init-better-defaults)
