(package-initialize)
(setq load-path (delete "/root/.emacs.d/elpa/org-mode/lisp" load-path))
(require 'org)
(add-to-list 'org-modules 'org-habit)
(require 'htmlize)
(setq
 org-directory (getenv "ORG_DIR")
 org-agenda-files (list (getenv "ORG_DIR"))
 org-agenda-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">"
 org-agenda-include-diary nil
 org-agenda-skip-scheduled-if-done t
 org-agenda-skip-deadline-if-done t
 org-agenda-skip-deadline-prewarning-if-scheduled t
 org-agenda-prefix-format '((agenda . " %i %-20:c%?-20t% s")
                            (todo   . " %i %-20:c")
                            (tags   . " %i %-20:c")
                            (search . " %i %-20:c"))
 org-todo-keywords '((sequence
                      "TODO(t)"
                      "PROJ(p)"
                      "LOOP(r)"
                      "STRT(s)"
                      "WAIT(w)"
                      "HOLD(h)"
                      "IDEA(i)"
                      "|"
                      "DONE(d)"
                      "KILL(k)"))
 org-agenda-custom-commands
 '(("X" agenda "" nil ("publish/agenda.html"))
   ("Y" alltodo "" nil ("publish/todo.html"))))
