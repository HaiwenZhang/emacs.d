
;; 高亮对应的括号
(show-paren-mode 1)



;;(add-hook 'window-setup-hook #'toggle-frame-fullscreen)

(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; Use default theme in terminals
(use-package doom-themes
  :ensure t
  :when (display-graphic-p)
  :config
  ;; (load-theme 'doom-monokai-pro t)
  ;; (load-theme 'doom-solarized-dark t)
  ;; (load-theme 'doom-tokyo-night t)
  (load-theme 'doom-nord t)
  (doom-themes-org-config))



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
      (haiwen/set-monospaced-font "Source Code Pro" "Source Code Pro" 20 20))
  )


(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; (setq-default cursor-type 'box)

;; 高亮当前行
;; (global-hl-line-mode 1)


;; modeline样式
(use-package 
  doom-modeline
  :ensure t
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

;; Customize popwin behavior
(use-package shackle
  :ensure t
  :hook (after-init . shackle-mode)
  :custom
  (shackle-default-size 0.5)
  (shackle-default-alignment 'below)
  (shackle-rules '((magit-status-mode    :select t :inhibit-window-quit t :same t)
                   (magit-log-mode       :select t :inhibit-window-quit t :same t)
                   (vc-annotate-mode     :select t :inhibit-window-quit t :same t)
                   ("*quickrun*"         :select t :inhibit-window-quit t :same t)
                   (profiler-report-mode :select t)
                   (xwidget-webkit-mode  :select t :same t)
                   (comint-mode          :select t :align t :size 0.4)
                   (grep-mode            :select t :align t)
                   (rg-mode              :select t :align t)
                   ;; See also `help-window-select'
                   (apropos-mode         :select nil :align t :size 0.4)
                   (help-mode            :select nil :align t :size 0.4)
                   ("*Flycheck errors*"         :select t   :align t :size 10)
                   ("*Backtrace*"               :select t   :align t :size 15)
                   ("*Shell Command Output*"    :select nil :align t :size 0.4)
                   ("*Async Shell Command*"     :select nil :align t :size 0.4)
                   ("*Org-Babel Error Output*"  :select nil :align t :size 0.3)
                   ("*package update results*"  :select nil :align t :size 10)
                   ("*Process List*"            :select t   :align t :size 0.3)
                   ("*Occur*"                   :select t   :align t)
                   ("\\*eldoc\\( for \\)?.*\\*" :select nil :align t :size 15 :regexp t))))

(use-package help
  :ensure nil
  :custom
  (help-window-select t)
  (help-enable-variable-value-editing t))

;; Windows layout recorder
;;
;; You can still use `winner-mode' on Emacs 26 or early. On Emacs 27, it's
;; preferred over `winner-mode' for better compatibility with `tab-bar-mode'.
(use-package tab-bar
  :ensure nil
  :hook (after-init . tab-bar-history-mode)
  :custom
  (tab-bar-history-buttons-show nil))

(use-package all-the-icons
  :ensure t
  :when (display-graphic-p)
  :demand t)

(use-package dashboard
  :ensure t
  :init
  ;; Format: "(icon title help action face prefix suffix)"
  (setq dashboard-navigator-buttons `(((,(if (fboundp 'all-the-icons-octicon) (all-the-icons-octicon "mark-github"      :height 1.0 :v-adjust  0.0) "★")
                                        "GitHub" "Browse" (lambda (&rest _) (browse-url homepage-url)))
                                       (,(if (fboundp 'all-the-icons-octicon) (all-the-icons-octicon "heart"            :height 1.1 :v-adjust  0.0) "♥")
                                        "Stars" "Show stars" (lambda (&rest _) (browse-url stars-url)))
                                       (,(if (fboundp 'all-the-icons-material) (all-the-icons-material "report_problem" :height 1.1 :v-adjust -0.2) "⚑")
                                        "Issue" "Report issue" (lambda (&rest _) (browse-url issue-url)) warning)
                                       (,(if (fboundp 'all-the-icons-material) (all-the-icons-material "update"         :height 1.1 :v-adjust -0.2) "♺")
                                        "Update" "Update packages synchronously" (lambda (&rest _) (package-update-all nil)) success))))
  (dashboard-setup-startup-hook)
  :hook (dashboard-mode . (lambda ()
                            (setq-local global-hl-line-mode nil)))
  :custom
  (dashboard-startup-banner 'logo)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-init-info t)
  (dashboard-set-navigator t)
  (dashboard-items '((recents   . 10)
                     (projects  . 5)
                     (bookmarks . 5))))

(provide 'init-ui)
