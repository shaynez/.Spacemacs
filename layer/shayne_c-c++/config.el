(add-hook 'c++-mode-hook 'shayne_c)
(add-hook 'c-mode-hook 'shayne_c)
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


;;hightlight called function
(font-lock-add-keywords
 'c-mode
 '(
   ("\\<\\(for\\|while\\|do\\|if\\|else\\|return\\|continue\\|break\\|switch\\|case\\|default\\)\\>"
    . font-lock-keyword-face)
   ("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-name-face)
   )
 )
(font-lock-add-keywords
 'c++-mode
 '(
   ("\\<\\(for\\|while\\|do\\|if\\|else\\|return\\|continue\\|break\\|switch\\|case\\|default\\)\\>"
    . font-lock-keyword-face)
   ("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-name-face)
   )
 )

