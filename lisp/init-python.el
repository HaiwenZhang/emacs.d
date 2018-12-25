
(use-package python
  :ensure nil
  :defines gud-pdb-command-name pdb-path
  :config
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil)

  (add-hook 'inferior-python-mode-hook
            (lambda ()
              ;; (bind-key "C-c C-z" #'kill-buffer-and-window inferior-python-mode-map)
              (process-query-on-exit-flag (get-process "Python")))))

(use-package live-py-mode
  :ensure t)

;; (setq ms-pyls-dir (expand-file-name "~/.emacs.d/python-language-server/"))

;; (defun render-markup-content (kind content)
;;   (message kind)
;;   (replace-regexp-in-string "&nbsp;" " " content))
;; (setq lsp-render-markdown-markup-content #'render-markup-content)

;; (defun get-python-ver-and-syspath (workspace-root)
;;   "return list with pyver-string and json-encoded list of python search paths."
;;   (let ((python (executable-find python-shell-interpreter))
;;         (init "from __future__ import print_function; import sys; import json;")
;;         (ver "print(\"%s.%s\" % (sys.version_info[0], sys.version_info[1]));")
;;         (sp (concat "sys.path.insert(0, '" workspace-root "'); print(json.dumps(sys.path))")))
;;     (with-temp-buffer
;;       (call-process python nil t nil "-c" (concat init ver sp))
;;       (subseq (split-string (buffer-string) "\n") 0 2))))

;; (defun ms-pyls-extra-init-params (workspace)
;;   (destructuring-bind (pyver pysyspath) (get-python-ver-and-syspath (lsp--workspace-root workspace))
;; 		      `(:interpreter (
;; 				      :properties (
;; 						   :InterpreterPath ,(executable-find python-shell-interpreter)
;; 						   ;; this database dir will be created if required
;; 						   :DatabasePath ,(expand-file-name (concat ms-pyls-dir "db/"))
;; 						   :Version ,pyver))
;; 				     ;; preferredFormat "markdown" or "plaintext"
;; 				     ;; experiment to find what works best -- over here mostly plaintext
;; 				     :displayOptions (
;; 						      :preferredFormat "plaintext"
;; 						      :trimDocumentationLines :json-false
;; 						      :maxDocumentationLineLength 0
;; 						      :trimDocumentationText :json-false
;; 						      :maxDocumentationTextLength 0)
;; 				     :searchPaths ,(json-read-from-string pysyspath))))

;; (lsp-define-stdio-client lsp-python "python"
;;                          #'ffip-get-project-root-directory
;;                          `("dotnet" ,(concat ms-pyls-dir "Microsoft.Python.LanguageServer.dll"))
;;                          :extra-init-params #'ms-pyls-extra-init-params)

(use-package py-autopep8
  :ensure t
  :config
  (defun python-mode-keys ()
    "Modify python-mode local key map"
    (local-set-key (kbd "C-c C-p") 'autopep8))
  (add-hook 'python-mode-hook 'python-mode-keys)
  (add-hook 'before-save-hook #'autopep8-before-save))



(provide 'init-python)
