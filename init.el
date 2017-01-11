
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-message t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;;关闭备份文件
(setq make-backup-files nil)

(require 'init-elpa)
(require 'init-osx)
(require 'init-theme)
(require 'init-ui)
(require 'init-org)
(require 'init-swiper)
(require 'init-company)
(require 'init-better-defaults)
(require 'init-git)
;;(require 'init-exec-path.el)

;; Programe Langulages
(require 'init-program)
(require 'init-ruby)
