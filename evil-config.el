(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(evil-mode t)

(define-key evil-insert-state-map "\C-c" 'evil-normal-state)
(define-key evil-visual-state-map "\C-c" 'evil-normal-state)

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "w" 'save-buffer
  "gg" 'vc-next-action
  "gp" 'magit-push
  "gu" 'magit-pull
  "gs" 'magit-status
  "gr" 'magit-refresh
  "SPC" 'evil-visual-line
  "m" 'compile
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "sp" 'ispell-buffer
  "i" 'whitespace-mode
  "f" 'auto-fill-mode
)

(defun run-python-file ()
    (call-process (concat "python3" buffer-file-name)))

(add-hook 'python-mode-hook (lambda () (evil-leader/set-key 
				      "r" 'run-python-file)))

(define-key evil-motion-state-map "," 'evil-repeat-find-char-reverse)
