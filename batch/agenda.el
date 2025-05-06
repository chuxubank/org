(package-initialize)
(setq load-path (delete "/root/.emacs.d/elpa/org-mode/lisp" load-path))

(require 'org-agenda)
(require 'htmlize)
(setq
 org-directory (getenv "ORG_DIR")
 org-agenda-files (list (getenv "ORG_DIR"))
 org-agenda-include-diary nil
 org-agenda-skip-scheduled-if-done t
 org-agenda-skip-deadline-if-done t
 org-agenda-skip-deadline-prewarning-if-scheduled t
 org-agenda-prefix-format '((agenda . " %i %-20:c%?-20t% s")
                            (todo   . " %i %-20:c")
                            (tags   . " %i %-20:c")
                            (search . " %i %-20:c"))
 org-todo-keywords '((sequence
                      "TODO(t)"  ; A task that needs doing & is ready to do
                      "PROJ(p)"  ; A project, which usually contains other tasks
                      "LOOP(r)"  ; A recurring task
                      "STRT(s)"  ; A task that is in progress
                      "WAIT(w)"  ; Something external is holding up this task
                      "HOLD(h)"  ; This task is paused/on hold because of me
                      "IDEA(i)"  ; An unconfirmed and unapproved task or notion
                      "|"
                      "DONE(d)"  ; Task successfully completed
                      "KILL(k)") ; Task was cancelled, aborted or is no longer applicable
                     )
 org-agenda-custom-commands
 '(("X" agenda "" nil ("publish/agenda.html"))
   ("Y" alltodo "" nil ("publish/todo.html"))))
