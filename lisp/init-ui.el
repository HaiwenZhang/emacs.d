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

;; ============================================================
;; Setting English Font
(set-face-attribute
 'default nil :font "Monaco 15")
;; Setting Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Source Code Pro" :size 14)))

(require-package 'powerline)
(setq powerline-default-separator 'utf-8)
(require-package 'spaceline)
(require 'spaceline-config)
(spaceline-spacemacs-theme)


(require-package 'beacon)
(beacon-mode 1)

(require-package 'mode-icons)
(mode-icons-mode t)

(provide 'init-ui)
