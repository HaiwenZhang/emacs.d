;;; init.el -*- lexical-binding: t; -*-
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

(setq package-archives '(("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
                        ("gnu" . "http://mirrors.cloud.tencent.com/elpa/gnu/")
                        ("org" . "http://mirrors.cloud.tencent.com/elpa/org/")))


;; (setq package-archives '(("gnu"   . "http://mirrors.zju.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.zju.edu.cn/elpa/melpa/")
;;                          ("org" . "http://mirrors.zju.edu.cn/elpa/org/")))

(setq package-check-signature nil)

(require 'package)

;;; Initialize the packages, avoiding a re-initialization
(unless (bound-and-true-p package--initialized) ;; To avoid warnings on 27
  ;; (when (version< emacs-version "27.0")
  (setq package-enable-at-startup nil)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

;; Settings for use-package package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure use-package prior to loading it
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-always-defer t
        use-package-expand-minimally t
        use-package-verbose t))


(eval-when-compile
  (require 'use-package))

(use-package gnu-elpa-keyring-update)
(use-package diminish)
(use-package bind-key)
(use-package delight)


;; A modern Packages Menu
(use-package paradox
  :init
  (setq paradox-execute-asynchronously t
        paradox-github-token t
        paradox-display-star-count nil)

  ;; Replace default `list-packages'
  (defun my-paradox-enable (&rest _)
    "Enable paradox, overriding the default package-menu."
    (paradox-enable))
  (advice-add #'list-packages :before #'my-paradox-enable)
  :config
  (when (fboundp 'page-break-lines-mode)
    (add-hook 'paradox-after-execute-functions
              (lambda (&rest _)
                (let ((buf (get-buffer-create "*Paradox Report*"))
                      (inhibit-read-only t))
                  (with-current-buffer buf
                    (page-break-lines-mode 1))))
              t)))

;; Auto update packages
(use-package auto-package-update
  :init
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results t)
  (defalias 'upgrade-packages #'auto-package-update-now))

(provide 'init-package)
