

;; Settings for which-key - suggest next key
(use-package which-key
  :defer nil
  :config (which-key-mode))

;; Settings for highlight parentheses
(use-package highlight-parentheses
  :diminish
  :hook (prog-mode . highlight-parentheses-mode))

;; 彩虹括号
(use-package 
  rainbow-delimiters 
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  ;; 设置每一级括号的颜色
  (set-face-foreground 'rainbow-delimiters-depth-1-face "chartreuse3") 
  (set-face-foreground 'rainbow-delimiters-depth-2-face "DodgerBlue1") 
  (set-face-foreground 'rainbow-delimiters-depth-3-face "DarkOrange2")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "deep pink") 
  (set-face-foreground 'rainbow-delimiters-depth-5-face "medium orchid") 
  (set-face-foreground 'rainbow-delimiters-depth-6-face "turquoise") 
  (set-face-foreground 'rainbow-delimiters-depth-7-face "lime green") 
  (set-face-foreground 'rainbow-delimiters-depth-8-face "gold") 
  (set-face-foreground 'rainbow-delimiters-depth-9-face "cyan") 
  (set-face-bold 'rainbow-delimiters-depth-1-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-2-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-3-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-4-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-5-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-6-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-7-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-8-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-9-face "t") 
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))


;; Restart emacs
(use-package restart-emacs);; Restart emacs

;; 回到关闭文件前光标的位置
(use-package saveplace
  :ensure t
  :hook (after-init . (lambda () (save-place-mode t))))

;; 跳转窗口
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
	;; 设置标记
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "magenta")))))))


;; 饥饿删除（一次性删除多个连续的空白符）
(use-package hungry-delete
  :ensure t
  :hook ('prog-mode . 'global-hungry-delete-mode))


(use-package recentf
	:ensure nil
	:bind (("C-x C-r" . recentf-open-files))
	:hook (after-init . recentf-mode)
	:init (setq recentf-max-saved-items 300
				recentf-exclude
				'("\\.?cache" ".cask" "url" "COMMIT_EDITMSG\\'" "bookmarks"
				  "\\.\\(?:gz\\|gif\\|svg\\|png\\|jpe?g\\|bmp\\|xpm\\)$"
				  "\\.?ido\\.last$" "\\.revive$" "/G?TAGS$" "/.elfeed/"
				  "^/tmp/" "^/var/folders/.+$" ; "^/ssh:"
				  (lambda (file) (file-in-directory-p file package-user-dir))))
	:config (push (expand-file-name recentf-save-file) recentf-exclude))

(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
              history-length 1000
              savehist-additional-variables '(mark-ring
                                              global-mark-ring
                                              search-ring
                                              regexp-search-ring
                                              extended-command-history)
              savehist-autosave-interval 300))

(use-package time
  :ensure nil
  :unless (display-graphic-p)
  :hook (after-init . display-time-mode)
  :init (setq display-time-24hr-format t
              display-time-day-and-date t))


;; Beacon mode
(use-package beacon
  :unless *is-windows*
  :hook (after-init . beacon-mode))

(use-package keycast
  :commands keycast-mode)

(use-package info-colors
  :unless *is-windows*
  :hook (Info-selection . info-colors-fontify-node))

(use-package indent-guide
  :hook (after-init-hook . indent-guide-global-mode))

;; (use-package paren
;;   :config (show-paren-mode 1))

;; 括号匹配
(use-package smartparens
  :ensure t 
  :hook (prog-mode . smartparens-mode))

;; 折叠和收缩代码
(use-package hideshow 
  :ensure t 
  :diminish hs-minor-mode
  :bind (:map prog-mode-map
              ("C-c TAB" . hs-toggle-hiding) 
              ("C-c p +" . hs-show-all)) 
  :hook (prog-mode . hs-minor-mode))

;; 撤销树
(use-package undo-tree 
  :ensure t 
  :hook (after-init . global-undo-tree-mode) 
  :init (setq undo-tree-visualizer-timestamps t undo-tree-enable-undo-in-region nil undo-tree-auto-save-history nil)

  ;; HACK: keep the diff window
  (with-no-warnings (make-variable-buffer-local 'undo-tree-visualizer-diff) 
                    (setq-default undo-tree-visualizer-diff t)))

;; 更改窗格布局
(use-package rotate
  :ensure t)

;; 命令日志
(use-package command-log-mode
  :ensure t)


(provide 'init-better)
