(package-initialize)
(setq load-path (delete "/root/.emacs.d/elpa/org-mode/lisp" load-path))

(require 'org-agenda)
(require 'htmlize)
(setq
 org-directory (getenv "ORG_DIR")
 org-agenda-files (list (getenv "ORG_DIR"))
 org-agenda-include-diary nil
 org-agenda-custom-commands
 '(("X" agenda "" nil ("publish/agenda.html"))
   ("Y" alltodo "" nil ("publish/todo.html"))))
