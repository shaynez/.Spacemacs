(defun company-yasnippet/disable-after-dot (fun command &optional arg &rest _ignore)
  (if (eq command 'prefix)
      (let ((prefix (funcall fun 'prefix)))
        (when (and prefix (not
                           (eq
                            (char-before (- (point) (length prefix)))
                            ?.)))
          prefix))
    (funcall fun command arg)))

;;(global-highlight-thing-mode t)
;;(setq highlight-thing-what-thing 'symbol)
;;(setq highlight-thing-delay-seconds 3)
;;(setq highlight-thing-limit-to-defun t)
;;(setq highlight-thing-case-sensitive-p t)
;;(set-face-attribute 'which-func nil :background "Blue1")

(defun vi-open-next-line (arg)
  "Move to the next line (like vi) and then opens a line."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (indent-according-to-mode))

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))
(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
    (jump-to-register 8)
    (set-register 8 tmp)))

;;(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
