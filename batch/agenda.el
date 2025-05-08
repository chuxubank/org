(setenv "TZ" "Asia/Shanghai")

(use-package org
  :ensure t
  :vc (org-mode :url "https://code.tecosaur.net/tec/org-mode"
                :lisp-dir "lisp/")
  :custom
  (org-directory (getenv "ORG_DIR"))
  (org-agenda-files (list (getenv "ORG_DIR")))
  (org-todo-keywords '((sequence
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
                       ))
  (org-todo-keyword-faces '(("STRT" . +org-todo-active)
                            ("WAIT" . +org-todo-onhold)
                            ("HOLD" . +org-todo-onhold)
                            ("PROJ" . +org-todo-project)
                            ("KILL" . +org-todo-cancel)))
  (org-enforce-todo-dependencies t)
  (org-enforce-todo-checkbox-dependencies nil)
  :custom-face
  (+org-todo-active  ((t (:inherit (bold font-lock-constant-face org-todo)))))
  (+org-todo-project ((t (:inherit (bold font-lock-doc-face org-todo)))))
  (+org-todo-onhold  ((t (:inherit (bold warning org-todo)))))
  (+org-todo-cancel  ((t (:inherit (bold org-done) :strike-through t))))
  :config
  (add-to-list 'org-modules 'org-habit))

(use-package htmlize
  :ensure t)

(setq
 org-habit-graph-column 60
 org-agenda-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/style.css\">"
 org-agenda-include-diary t
 org-agenda-skip-scheduled-if-done t
 org-agenda-skip-deadline-if-done t
 org-agenda-skip-deadline-prewarning-if-scheduled t
 org-agenda-prefix-format '((agenda . " %i %-20:c%?-12t% s")
                            (todo   . " %i %-20:c")
                            (tags   . " %i %-20:c")
                            (search . " %i %-20:c"))
 org-agenda-custom-commands
 '(("X" agenda "" nil ("publish/agenda.html"))
   ("Y" alltodo "" nil ("publish/todo.html"))))
