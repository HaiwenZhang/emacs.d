(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(global-set-key (kbd "C-c a") 'org-agenda)


;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/Dropbox/orgfiles"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; (setq org-agenda-custom-commands
;;       '(("c" "Simple agenda view"
;;          ((agenda "")
;; 	  (alltodo "")))))

(use-package org-ac
  :ensure t
  :init (progn
	  (require 'org-ac)
	  (org-ac/config-default)
	  ))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates
      '(("a" "Appointment" entry (file  "~/Dropbox/orgfiles/gcal.org" )
	 "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
	("l" "Link" entry (file+headline "~/Dropbox/orgfiles/links.org" "Links")
	 "* %? %^L %^g \n%T" :prepend t)
	("b" "Blog idea" entry (file+headline "~/Dropbox/orgfiles/blog.org" "Blog Topics:")
	 "* %?\n%T" :prepend t)
	("t" "To Do Item" entry (file+headline "~/Dropbox/orgfiles/gtd.org" "To Do")
	 "* TODO %?\n%u" :prepend t)
	("n" "Note" entry (file+headline "~/Dropbox/orgfiles/note.org" "Note space")
	 "* %?\n%u" :prepend t)

	("j" "Journal" entry (file+datetree "~/Dropbox/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")
	("s" "Screencast" entry (file "~/Dropbox/orgfiles/screencastnotes.org")
	 "* %?\n%i\n")))

(defadvice org-capture-finalize 
    (after delete-capture-frame activate)  
  "Advise capture-finalize to close the frame"  
  (if (equal "capture" (frame-parameter nil 'name))  
      (delete-frame)))

(defadvice org-capture-destroy 
    (after delete-capture-frame activate)  
  "Advise capture-destroy to close the frame"  
  (if (equal "capture" (frame-parameter nil 'name))  
      (delete-frame)))

(use-package org-pomodoro
  :ensure t)

(use-package noflet
  :ensure t)

(defun make-capture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame '((name . "capture")))
  (select-frame-by-name "capture")
  (delete-other-windows)
  (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
	  (org-capture)))


(provide 'init-org)
