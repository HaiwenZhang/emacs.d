;;; init-consts.el -*- lexical-binding: t; -*-
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
(require 'init-consts)

(with-no-warnings
  (cond
   (*is-mac*
	(setq mac-option-modifier 'meta
		  mac-command-modifier 'super)
    ;; Make mouse wheel / trackpad scrolling less jerky
    (setq mouse-wheel-scroll-amount '(1
                                      ((shift) . 5)
                                      ((control))))
    (dolist (multiple '("" "double-" "triple-"))
      (dolist (direction '("right" "left"))
        (global-set-key (read-kbd-macro (concat "<" multiple "wheel-" direction ">")) 'ignore)))
    (global-set-key (kbd "M-`") 'ns-next-frame)
    (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
    (global-set-key (kbd "M-˙") 'ns-do-hide-others)
    (with-eval-after-load 'nxml-mode
      (define-key nxml-mode-map (kbd "M-h") nil))
    (global-set-key (kbd "M-ˍ") 'ns-do-hide-others) ;; what describe-key reports for cmd-option-h
    )))

(provide 'init-osx)
