;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; setting theme
;; (use-package monokai-theme
;;   :ensure t)

(use-package dakrone-theme
   :ensure t)
;; (use-package zenburn-theme
;;   :ensure t)

;; (use-package gruvbox-theme
;;   :ensure t)

;;设置光标
(setq-default cursor-type 'bar)
(set-cursor-color "green")
;; 高亮当前行
(global-hl-line-mode t)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)

;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
;; Setting English Font
(set-face-attribute
 'default nil :font "Source Code Pro 16")
;; Chinese Font 配制中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Source Code Pro" :size 15)))

(use-package default-text-scale
  :ensure t
  :bind(
	("C-M-=" . default-text-scale-increase)
	("C-M--" . default-text-scale-decrease)))


;; powerline setting
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme)
  (setq powerline-default-separator 'utf-8))

(provide 'init-ui)
