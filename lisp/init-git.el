;; git gutter config
(require-package 'git-gutter-fringe)
(require 'git-gutter-fringe)
(set-face-foreground 'git-gutter-fr:modified "#FF00FF")
(set-face-foreground 'git-gutter-fr:added    "#00FF00")
(set-face-foreground 'git-gutter-fr:deleted  "#FF0000")
;; Please adjust fringe width if your own sign is too big.
(setq-default left-fringe-width  20)
(setq-default right-fringe-width 20)

(fringe-helper-define 'git-gutter-fr:added nil
  ".XXXXXX."
  "XX....XX"
  "X......X"
  "X......X"
  "XXXXXXXX"
  "XXXXXXXX"
  "X......X"
  "X......X")

(fringe-helper-define 'git-gutter-fr:deleted nil
  "XXXXXX.."
  "XX....X."
  "XX.....X"
  "XX.....X"
  "XX.....X"
  "XX.....X"
  "XX....X."
  "XXXXXX..")

(fringe-helper-define 'git-gutter-fr:modified nil
  "XXXXXXXX"
  "X..XX..X"
  "X..XX..X"
  "X..XX..X"
  "X..XX..X"
  "X..XX..X"
  "X..XX..X"
  "X..XX..X")
(global-git-gutter-mode +1)

;; magit config
(require-package 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(global-set-key (kbd "C-x M-l") 'magit-log-buffer-file)

(provide 'init-git)
