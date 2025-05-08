(setenv "TZ" "Asia/Shanghai")
(package-initialize)
(require 'org)
(add-to-list 'org-modules 'org-habit)
(require 'htmlize)
(custom-set-faces
 '(+org-todo-active   ((t (:inherit (bold font-lock-constant-face org-todo)))))
 '(+org-todo-project  ((t (:inherit (bold font-lock-doc-face org-todo)))))
 '(+org-todo-onhold   ((t (:inherit (bold warning org-todo)))))
 '(+org-todo-cancel   ((t (:inherit (bold org-done)) :strike-through t))))
(setq
 org-directory (getenv "ORG_DIR")
 org-habit-graph-column 60
 org-agenda-files (list (getenv "ORG_DIR"))
 org-agenda-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/style.css\">"
 org-agenda-include-diary nil
 org-agenda-skip-scheduled-if-done t
 org-agenda-skip-deadline-if-done t
 org-agenda-skip-deadline-prewarning-if-scheduled t
 org-agenda-prefix-format '((agenda . " %i %-20:c%?-12t% s")
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
 org-todo-keyword-faces '(("STRT" . +org-todo-active)
                          ("WAIT" . +org-todo-onhold)
                          ("HOLD" . +org-todo-onhold)
                          ("PROJ" . +org-todo-project)
                          ("KILL" . +org-todo-cancel))
 org-agenda-custom-commands
 '(("X" agenda "" nil ("publish/agenda.html"))
   ("Y" alltodo "" nil ("publish/todo.html"))))
