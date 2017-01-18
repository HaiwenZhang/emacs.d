;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 高亮当前行
(global-hl-line-mode t)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;;设置光标
(setq-default cursor-type 'bar)
(set-cursor-color "green")

;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
;; Setting English Font
(set-face-attribute
 'default nil :font "Monaco 14")
;; Chinese Font 配制中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "PingFang SC" :size 14)))

;; setting theme
(use-package monokai-theme
  :ensure t
  )

(use-package nyan-mode
  :ensure t
  :init (nyan-mode 1))

;; flashes the cursor's line when you scroll
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  (setq beacon-color "#666600"))

;; powerline setting
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme)
  (setq powerline-default-separator 'utf-8))


(provide 'init-ui)
