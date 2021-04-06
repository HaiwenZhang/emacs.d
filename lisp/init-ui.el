
;; 高亮对应的括号
(show-paren-mode 1)



;;(add-hook 'window-setup-hook #'toggle-frame-fullscreen)

(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; (when window-system
;;   (set-frame-position (selected-frame) 0 0)
;;   (set-frame-size (selected-frame) 91 63))

(use-package doom-themes
  :init (load-theme 'doom-one t))


;; (use-package monokai-theme
;;   :init (load-theme 'monokai t))

;; (use-package solarized-theme
;;   :init (load-theme 'solarized-dark t))

(defun haiwen/set-monospaced-font (english chinese e-size c-size)
  "cabins/set-monospaced-font is used for setting monospaced font"
  (set-face-attribute 'default nil
                      :font (font-spec
                             :name english
                             :weight 'normal
                             :slant 'normal
                             :size e-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec
                       :name chinese
                       :weight 'normal
                       :slant 'normal
                       :size c-size))))


(when (display-graphic-p)
  (if *is-windows*
      ;; font setting for Windows platform
      (haiwen/set-monospaced-font "Courier New" "Microsoft Yahei Mono" 13 13))
  (if *is-mac*
      ;; font setting for macOS platform
      (haiwen/set-monospaced-font "Fira Code" "Helvetica" 15 15))
  (if *is-linux*
      ;; font setting for GNU/Linux platform
      (haiwen/set-monospaced-font "Monaco" "Helvetica" 13 13))
  )


(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(setq-default cursor-type 'box)

;; 高亮当前行
(global-hl-line-mode 1)

;; 切换buffer焦点时高亮动画
(use-package beacon
  :disabled
  :ensure t
  :hook (after-init . beacon-mode))

;; modeline样式
(use-package 
  doom-modeline
  :disabled
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 10)
  (doom-modeline-bar-width 3)
  (doom-modeline-buffer-file-name-style 'file-name)
  :config
  (custom-set-faces '(mode-line ((t 
                                  (:family evan/font-name
                                           :style evan/font-style
                                           :height 125)))) 
                    '(mode-line-inactive ((t 
                                           (:family evan/font-name
                                                    :style evan/font-size
                                                    :height 125))))))

;; 竖线
(use-package page-break-lines
  :ensure t
  :hook (after-init . global-page-break-lines-mode)
  :config
  (set-fontset-font "fontset-default"
                  (cons page-break-lines-char page-break-lines-char)
                  (face-attribute 'default :family))
  (let ((table (make-char-table nil)))                   ;; make a new empty table
    (set-char-table-parent table char-width-table)       ;; make it inherit from the current char-width-table
    (set-char-table-range table page-break-lines-char 1) ;; let the width of page-break-lines-char be 1
    (setq char-width-table table)))

;; Font settings
(use-package emacs
  :when (display-graphic-p)
  :config
  (set-default 'cursor-type 'bar)
  ;; I prefer the cursor be red color, 'cause it's more obvious.
  (set-face-background 'cursor "#FF0000")
  (setq-default scroll-up-aggressively 0.01
                scroll-down-aggressively 0.01)
  (setq default-frame-alist '((width . 180) (height . 40)))
  (setq redisplay-dont-pause t
        scroll-conservatively most-positive-fixnum
        scroll-margin 1
        scroll-step 1
        scroll-preserve-screen-position 'always)
  )

(provide 'init-ui)
