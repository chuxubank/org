(package-initialize)
(require 'org-agenda)
(require 'htmlize)
(setq org-agenda-custom-commands
      '(("X" agenda "" nil ("agenda.html"))))
