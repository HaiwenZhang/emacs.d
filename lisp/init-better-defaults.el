;; close back up file 
(setq make-backup-files nil)
;; 简化yes和no
(fset 'yes-or-no-p 'y-or-n-p)

(when *is-a-mac*
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta))

(use-package which-key
  :ensure t 
  :config
  (which-key-mode))

;;  Undo tree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(use-package all-the-icons
  :ensure t)

(use-package windresize
  :ensure t
  :config (global-set-key (kbd "C-c m") 'windresize))

;;;Winner-mode
;;可以使用 Ctrl-c ← （就是向左的箭头键）组合键，退回你的上一个窗口设置。）
;;可以使用 Ctrl-c → （前进一个窗口设置。）
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings))


;;;windmove-mode
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings)
  (global-set-key (kbd "C-c j")  'windmove-left)
  (global-set-key (kbd "C-c l") 'windmove-right)
  (global-set-key (kbd "C-c i")    'windmove-up)
  (global-set-key (kbd "C-c k")  'windmove-down))

;; (use-package neotree
;;   :ensure t
;;   :bind ("<f8>" . neotree-toggle)
;;   :config (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))


(use-package hydra 
  :ensure hydra
  :init 
  (global-set-key
   (kbd "C-x t")
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
     ( :pre (linum-mode 1)
	    :post (linum-mode -1))
     "goto"
     ("t" (lambda () (interactive)(move-to-window-line-top-bottom 0)) "top")
     ("b" (lambda () (interactive)(move-to-window-line-top-bottom -1)) "bottom")
     ("m" (lambda () (interactive)(move-to-window-line-top-bottom)) "middle")
     ("e" (lambda () (interactive)(end-of-buffer)) "end")
     ("c" recenter-top-bottom "recenter")
     ("n" next-line "down")
     ("p" (lambda () (interactive) (forward-line -1))  "up")
     ("g" goto-line "goto-line")
     ))
  (global-set-key
   (kbd "C-c t")
   (defhydra hydra-global-org (:color blue)
     "Org"
     ("t" org-timer-start "Start Timer")
     ("s" org-timer-stop "Stop Timer")
     ("r" org-timer-set-timer "Set Timer") ; This one requires you be in an orgmode doc, as it sets the timer for the header
     ("p" org-timer "Print Timer") ; output timer value to buffer
     ("w" (org-clock-in '(4)) "Clock-In") ; used with (org-clock-persistence-insinuate) (setq org-clock-persist t)
     ("o" org-clock-out "Clock-Out") ; you might also want (setq org-log-note-clock-out t)
     ("j" org-clock-goto "Clock Goto") ; global visit the clocked task
     ("c" org-capture "Capture") ; Don't forget to define the captures you want http://orgmode.org/manual/Capture.html
     ("l" (or )rg-capture-goto-last-stored "Last Capture"))

   ))

(defhydra multiple-cursors-hydra (:hint nil)
  "
     ^Up^            ^Down^        ^Other^
----------------------------------------------
[_p_]   Next    [_n_]   Next    [_l_] Edit lines
[_P_]   Skip    [_N_]   Skip    [_a_] Mark all
[_M-p_] Unmark  [_M-n_] Unmark  [_r_] Mark by regexp
^ ^             ^ ^             [_q_] Quit
"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("r" mc/mark-all-in-region-regexp :exit t)
  ("q" nil)

  ("<mouse-1>" mc/add-cursor-on-click)
  ("<down-mouse-1>" ignore)
  ("<drag-mouse-1>" ignore))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config 
  ;; (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :init
  (dumb-jump-mode)
  :ensure
  )


(provide 'init-better-defaults)
