;;; init-hydra.el --- haiwen                         -*- lexical-binding: t; -*-

;; Copyright (C) 2018  haiwen

;; Author: haiwen <haiwensummer@gmail.com>
;; Keywords: emacs

(use-package hydra 
  :ensure hydra
  :init 
  (global-set-key
   (kbd "C-c t")
   (defhydra toggle (:color blue)
     "toggle"
     ("a" abbrev-mode "abbrev")
     ("s" flyspell-mode "flyspell")
     ("d" toggle-debug-on-error "debug")
     ("c" fci-mode "fCi")
     ("f" auto-fill-mode "fill")
     ("t" toggle-truncate-lines "truncate")
     ("w" whitespace-mode "whitespace")
     ("q" nil "cancel")))
  (global-set-key
   (kbd "C-x j")
   (defhydra gotoline 
     (:pre (set-cursor-color "#40e0d0")
	   :post (progn
		   (set-cursor-color "#ffffff")
		   (message
		    "Thank you, come again.")))
     
     "like vim"
     ("t" (lambda () (interactive)(move-to-window-line-top-bottom 0)) "top")
     ("b" (lambda () (interactive)(move-to-window-line-top-bottom -1)) "bottom")
     ("m" (lambda () (interactive)(move-to-window-line-top-bottom)) "middle")
     ("gg" (lambda () (interactive)(beginning-of-buffer)) "head")
     ("G" (lambda () (interactive)(end-of-buffer)) "end")
     ("c" recenter-top-bottom "recenter")
     ("l" forward-char "right")
     ("h" backward-char "left")
     ("j" next-line "down")
     ("k" (lambda () (interactive) (forward-line -1))  "up")
     ("go" goto-line "goto-line")
     ("q" nil "quit")
     )))


(provide 'init-hydra)
