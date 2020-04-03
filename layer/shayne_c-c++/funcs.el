
;; This is a function copied from stackoverflow to facify #if 0/#else/#endif keywords.
;; The comments are added by myself to make it understandable.
(defun my-c-mode-font-lock-if0 (limit)
  (save-restriction
    (widen)
    (save-excursion
      (goto-char (point-min))
      (let ((depth 0) str start start-depth)
        ;; Search #if/#else/#endif using regular expression.
        (while (re-search-forward "^\\s-*#\\s-*\\(if\\|else\\|endif\\)" limit 'move)
          (setq str (match-string 1))
          ;; Handle #if.
          (if (string= str "if")
              (progn
                (setq depth (1+ depth))
                ;; Handle neariest 0.
                (when (and (null start) (looking-at "\\s-+0"))
                  (setq start (match-end 0)
                        start-depth depth)))
            ;; Handle #else, here we can decorate #if 0->#else block using 'font-lock-comment-face'.
            (when (and start (= depth start-depth))
              (c-put-font-lock-face start (match-beginning 0) 'font-lock-comment-face)
              (setq start nil))
            ;; Handle #endif, return to upper block if possible.
            (when (string= str "endif")
              (setq depth (1- depth)))))
        ;; Corner case when there are only #if 0 (May be you are coding now:))
        (when (and start (> depth 0))
          (c-put-font-lock-face start (point) 'font-lock-comment-face)))))
  nil)


(defun my-c-mode-common-hook ()
  (font-lock-add-keywords
   nil
   '((my-c-mode-font-lock-if0 (0 font-lock-comment-face prepend))) 'add-to-end))

(defun bhj-isearch-from-bod (&optional col-indent)
  (interactive "p")
  (let ((word (current-word)))
    (ska-point-to-register)
    (beginning-of-defun)
    (setq regexp-search-ring (cons (concat "\\b" word "\\b") regexp-search-ring))
    (search-forward-regexp (concat "\\b" word "\\b"))))


(defun shayne_c ()
  ;;(interactive)
  ;;(helm-gtags-mode t)
  (which-function-mode t)
  (read-only-mode t)
  ;;(read-only-mode t)
  ;; (define-key c++-mode-map (kbd "M-/") 'helm-gtags-resume)
  ;; (define-key c++-mode-map (kbd "M-i") 'helm-semantic-or-imenu)
  ;; (define-key c-mode-map (kbd "M-/") 'helm-gtags-resume)
  ;; (define-key c-mode-map (kbd "M-i") 'helm-semantic-or-imenu)
  (define-key c-mode-base-map (kbd "M-/") 'helm-gtags-resume)
  (define-key c-mode-base-map (kbd "M-i") 'helm-semantic-or-imenu)
  (define-key c-mode-base-map (kbd "C-c l") 'bhj-isearch-from-bod)
  (add-hook 'helm-after-persistent-action-hook 'which-func-update);;only enable in c/c++-mode
  
  (setq c-basic-offset 4)
  )

