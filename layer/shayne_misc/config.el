

(advice-add #'company-yasnippet :around #'company-yasnippet/disable-after-dot)


(global-set-key (kbd "C-o") 'vi-open-next-line)

;;(global-set-key [C-f1] 'show-file-name)
(global-set-key (kbd "M-g f") 'show-file-name)
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

(global-set-key (kbd "C-c w") 'ska-point-to-register)
(global-set-key (kbd "C-c j") 'ska-jump-to-register)

;;快速切换至上个buffer
(global-set-key (kbd "<backtab>") #'(lambda ()
                                      (interactive)
                                      (switch-to-buffer (other-buffer (current-buffer) 1))))

