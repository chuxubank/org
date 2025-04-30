(package-initialize)
(require 'org-agenda)
(require 'htmlize)
(setq
 org-agenda-files (list "/root/org/")
 org-agenda-custom-commands
 '(("X" agenda "" nil ("agenda.html"))))
