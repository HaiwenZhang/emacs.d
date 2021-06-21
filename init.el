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


;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
(defun update-load-path (&rest _)
  "Update `load-path'."
  (dolist (dir '("site-lisp" "lisp"))
    (push (expand-file-name dir user-emacs-directory) load-path)))

;;(defun add-subdirs-to-load-path (&rest _)
;;  "Add subdirectories to `load-path'."
;;  (let ((default-directory (expand-file-name "site-lisp" user-emacs-directory)))
;;    (normal-top-level-add-subdirs-to-load-path)))

(advice-add #'package-initialize :after #'update-load-path)
;;(advice-add #'package-initialize :after #'add-subdirs-to-load-path)

(update-load-path)

;; (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp/")))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Packages
(require 'init-package)

;;(setq ns-use-native-fullscreen nil)
(require 'init-startup)
(require 'init-consts)
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
(require 'init-go)
(require 'init-rust)

;;; init.el ends here
