;; -*- lexical-binding: t; -*-

(set-time-zone-rule nil)
(package-initialize)

(use-package org
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
  (add-to-list 'org-modules 'org-habit)
  (org-version))

(use-package htmlize
  :ensure t)

(use-package org-habit
  :custom
  (org-habit-graph-column 60))

(use-package org-agenda
  :custom
  (org-agenda-file-regexp "\\`[^.].*\\.org\\(\\.gpg\\)?\\'")
  (org-agenda-include-diary t)
  (org-agenda-show-current-time-in-grid (getenv "SHOW_CURRENT_TIME"))
  (org-agenda-skip-scheduled-if-done t)
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-skip-deadline-prewarning-if-scheduled t)
  (org-agenda-skip-scheduled-repeats-after-deadline t)
  (org-agenda-prefix-format '((agenda . " %i %-20:c%?-12t% s")
                              (todo   . " %i %-20:c")
                              (tags   . " %i %-20:c")
                              (search . " %i %-20:c")))
  (org-agenda-custom-commands
   '(("X" agenda "" ((org-agenda-span 14)) ("publish/agenda.html"))
     ("Y" alltodo "" nil ("publish/todo.html"))))
  (org-agenda-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/style.css\">"))

(use-package bbdb
  :ensure t
  :custom
  (bbdb-file (expand-file-name "bbdb.gpg" (getenv "ORG_DIR")))
  :config
  (bbdb-initialize))

(use-package diary
  :custom
  (diary-file (expand-file-name "diary" (getenv "ORG_DIR"))))
