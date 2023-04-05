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

;; A big contributor to startup times is garbage collection. We up the gc
;; threshold to temporarily prevent it from running, and then reset it by the
;; `gcmh' package.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Increase how much is read from processes in a single chunk (default is 4kb).
;; `lsp-mode' benefits from that.
(setq read-process-output-max (* 4 1024 1024))

(require 'package)
(setq package-archives '(("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
                        ("gnu" . "http://mirrors.cloud.tencent.com/elpa/gnu/")
                        ("org" . "http://mirrors.cloud.tencent.com/elpa/org/")))


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t))
(eval-when-compile
  (require 'use-package))

;; Keep ~/.emacs.d/ clean.
(use-package no-littering
  :ensure t
  :demand t)

;; Bootstrap `quelpa'.
(use-package quelpa
  :ensure t
  :commands quelpa
  :custom
  (quelpa-git-clone-depth 1)
  (quelpa-self-upgrade-p nil)
  (quelpa-update-melpa-p nil)
  (quelpa-checkout-melpa-p nil))

;; --debug-init implies `debug-on-error'.
(setq debug-on-error init-file-debug)

(let ((dir (locate-user-emacs-file "lisp")))
  (add-to-list 'load-path (file-name-as-directory dir))
  (add-to-list 'load-path (file-name-as-directory (expand-file-name "lang" dir))))

(setq custom-file (locate-user-emacs-file "custom.el"))

;; (setq ns-use-native-fullscreen nil)
;; (require 'init-startup)
(require 'init-consts)
(require 'init-osx)
(require 'init-basic)
(require 'init-better)
;; Preferences
(require 'init-hydra) 
;;(require 'init-kbd)
(require 'init-ui)
(require 'init-ivy)
(require 'init-complete)
;;; program
(require 'init-lisp)

;;(require 'init-latex)
;; (require 'init-go)
;; (require 'init-rust)

;;; init.el ends here

