(defun my-org-horizontal-block (backend)
  (let ((attrs '((:html . "<div style=\"display: flex; justify-content: space-around;\">")
                 (:latex . "\\begin{minipage}{0.25\\textwidth}"))))
    (dolist (block (org-element-map (org-element-parse-buffer) 'special-block
                     (lambda (b) (when (string= (org-element-property :type b) "abcd") b))))
      (let ((contents (org-element-interpret-data (org-element-contents block))))
        (pcase backend
          (`html (format "%s\n%s\n</div>" (alist-get :html attrs) contents))
          (`latex (format "%s\n%s\n\\end{minipage}" (alist-get :latex attrs) contents)))))))

(add-hook 'org-export-before-parsing-hook 'my-org-horizontal-block)
