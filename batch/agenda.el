(package-initialize)

(require 'org)
(org-version nil t)
(require 'org-agenda)
(require 'htmlize)
(setq
 org-directory "/root/org"
 org-agenda-files (list "/root/org/")
 org-agenda-include-diary nil
 org-agenda-custom-commands
 '(("X" agenda "" nil ("agenda.html"))))
