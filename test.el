(defun my-org-option-block-transform (backend)
  "Transform #+begin_option blocks to horizontal display for HTML and LaTeX export."
  (when (memq backend '(html latex))
    (let ((case-fold-search t))
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward "^#\\+begin_option\\s-*\n\\(\\(?:- .*\\(?:\n\\|\\'\\)\\)+\\)#\\+end_option" nil t)
          (let* ((content (match-string 1))
                 (options (split-string content "\n" t))
                 (labels (mapcar (lambda (n) (char-to-string (+ n 65))) (number-sequence 0 (1- (length options)))))
                 (formatted-options (mapconcat (lambda (opt)
                                                 (concat (pop labels) ". " (string-trim opt)))
                                               options " ")))
            (replace-match
             (if (eq backend 'html)
                 ;; HTML 输出格式，包含内联 CSS 样式
                 (format "<div style=\"display: flex; flex-wrap: wrap; gap: 1em;\">%s</div>" formatted-options)
               ;; LaTeX 输出格式，使用 \optionblock 宏
               (format "\\optionblock{%s}" formatted-options))
             t t)))))))

(add-hook 'org-export-before-parsing-hook #'my-org-option-block-transform)
