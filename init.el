 ;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f7>") 'open-init-file)

;; package manage
(require 'init-package)

;; base setting
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-swiper)
;; (require 'init-org)
(require 'init-exec-path-from-shell)
(require 'init-dired)

;; ;; program setting
(require 'init-projectile)
(require 'init-treemacs)
(require 'init-git)
;;(require 'init-yasnippet)
(require 'init-program)
(require 'init-company)
(require 'init-flycheck)
(require 'init-lsp)
;; (require 'init-ruby)
;; (require 'init-web)
;; (require 'init-js)
(require 'init-python)
(require 'init-java)
;;(require 'init-go)
;; (require 'init-yaml)
;; (require 'init-markdown)
(require 'init-cpp)
;; (require 'init-scala)

;; ;; keybindings
(require 'init-hydra)
