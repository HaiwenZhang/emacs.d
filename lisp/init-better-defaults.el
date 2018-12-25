


;; Disable backup files
(setq make-backup-files nil) ;; stop creating backup~ files
(setq auto-save-default nil) ;; stop creating #autosave# files
;; 简化yes和no
(fset 'yes-or-no-p 'y-or-n-p)

(when *is-a-mac*
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (setq ns-use-proxy-icon  nil)
  (setq frame-title-format nil))

;; 启动emacs时全屏
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))


;;========================================================================================
;;                                显示空格及其颜色配置
;;========================================================================================
;; 显示空格
;; (require 'whitespace)
;; (global-whitespace-mode t)

;; 粉色代表超过80个字符的部分,由lines-tail 参数控制
;; space-mark 参数表示显示空格
;; newline-mark 表示显示末尾的$符号
;; lines-tail 表示显示超过80个字符后的部分,用粉色高亮
;; trailing 表示高亮显示行尾的空格
;; spaces 下面要控制whitespace-space就必须包含这个参数
;; newline 下面要控制whitespace-newline就必须包含这个参数
;; 根据时间自动切换主题

;; (setq whitespace-style
;;       '(face
;;         ;; trailing blanks
;;         trailing
;;         ;; empty lines at beginning and/or end of buffer
;;         ;; empty
;;         ;; line is longer `whitespace-line-column'
;;         lines-tail
;;         ;; tab or space at the beginning of the line according to
;;         ;; `indent-tabs-mode'
;;         indentation
;;         ;; show tab as » (see `whitespace-display-mappings')
;;         tab-mark
;;         space-mark
;;         spaces
;;         ))

;; ;; 设置空格字符的颜色
;; (set-face-attribute 'whitespace-space nil :background "black")
;; (set-face-attribute 'whitespace-space nil :foreground "dim gray")

;; (when *is-a-mac*
;;   (add-to-list 'default-frame-alist '(fullscreen . maximized)))

;;=======================================================================================
;;                                  设置(utf-8)模式
;;=======================================================================================
;;默认写入文件的编码
(setq default-buffer-file-coding-system 'utf-8)
;;默认读取文件的编码
(prefer-coding-system 'utf-8)
;;终端方式的编码方式
;;(set-terminal-coding-system 'utf-8)
;;键盘输入的编码方式
;;(set-keyboard-coding-system 'utf-8)
;;读取或写入文件名的编码方式
;;(setq file-name-coding-system 'utf-8)

;;========================================================================================
;;                       复制当前行,当没有选中时,M-w就是复制当前行
;;========================================================================================
(global-set-key "\M-w"
		(lambda ()
		  (interactive)
		  (if mark-active
		      (kill-ring-save (region-beginning)
				      (region-end))
		    (progn
		      (kill-ring-save (line-beginning-position)
				      (line-end-position))
		      (message "copied line")))))

;;========================================================================================
;;                       剪切当前行,当没有选中时,C-w就是剪切当前行
;;========================================================================================
(global-set-key "\C-w"
		(lambda ()
		  (interactive)
		  (if mark-active
		      (kill-region (region-beginning)
				   (region-end))
		    (progn
		      (kill-region (line-beginning-position)
				   (line-end-position))
		      (message "killed line")))))


(use-package which-key
  :ensure t 
  :config
  (which-key-mode))

;;  Undo tree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(use-package all-the-icons
  :ensure t)

(use-package windresize
  :ensure t
  :config (global-set-key (kbd "C-c m") 'windresize))


;;;windmove-mode
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings)
  (global-set-key (kbd "C-c j")  'windmove-left)
  (global-set-key (kbd "C-c l") 'windmove-right)
  (global-set-key (kbd "C-c i")    'windmove-up)
  (global-set-key (kbd "C-c k")  'windmove-down))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config 
  ;; (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :init
  (dumb-jump-mode)
  :ensure
  )

(use-package autoinsert
  :ensure t
  :config
  (setq auto-insert-query nil)
  (setq auto-insert-directory (locate-user-emacs-file "template"))
  (add-hook 'find-file-hook 'auto-insert)
  (auto-insert-mode t))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Emacs, Haiwen!")
  )

(provide 'init-better-defaults)
