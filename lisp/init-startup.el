;;; init-startup.el -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 Haiwen
;;
;; Author: Haiwen Zhang
;; Maintainer: Haiwen <haiwensummer@gmail.com>
;; Created: November 13, 2020
;; Modified: November 13, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage:
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;
;;
;;; Code:
(setq initial-scratch-message "\n;; Hello Haiwen! \n;; Enjoy!\n\n")



(setq default-directory "~/")
(setq command-line-default-directory "~/")

(defun exec-path-from-shell-setenv (name value)
  "Set the value of environment var NAME to VALUE.
Additionally, if NAME is \"PATH\" then also set corresponding
variables such as `exec-path'."
  (setenv name value)
  (when (string-equal "PATH" name)
    (setq eshell-path-env value
          exec-path (append (parse-colon-path value) (list exec-directory)))))
;;调用exec-path-from-shell-setenv，手动传入参数，每次修改PATH都要到这里修改一下。还好我修改不频繁
(exec-path-from-shell-setenv "PATH" "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Library/Apple/usr/bin:/Users/haiwen/maven/bin:$HOME/go/bin:$HOME/maven/bin:$HOME/.cargo/bin")

(exec-path-from-shell-setenv "GOPATH" "$HOME/go")
(exec-path-from-shell-setenv "GO111MODULE" "on")


;; (use-package exec-path-from-shell
;;   :if (memq window-system '(mac ns x))
;;   :ensure t
;;   :config
;;   (setq exec-path-from-shell-variables '("PATH" "MANPATH")
;;         exec-path-from-shell-arguments '("-l"))
;;   (exec-path-from-shell-initialize)
;;   (exec-path-from-shell-copy-env "GOPATH")
;;   )

;; (let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
;;   (setenv "PATH" path)
;;   (setq exec-path 
;;         (append
;;          (split-string-and-unquote path ":")
;;          exec-path)))

(provide 'init-startup)

;;; ends here
