;;;; Evil mode
;;;;;;;; Bootstrapper
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

(require-package 'evil)

;;;;;;;; Configuration
(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)

(define-key evil-insert-state-map "\C-c" 'evil-normal-state)
(define-key evil-visual-state-map "\C-c" 'evil-normal-state)

;;;;PACKAGES

(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/evil-org-mode"))

(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")

(require 'org)
(require 'evil-org)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(require-package 'git-gutter)
(global-git-gutter-mode +1)

(require-package 'monokai-theme)
(load-theme 'monokai t)

;(require 'whitespace)
;(global-whitespace-mode 1)

(require-package 'magit)
(require 'magit)

(require 'tramp)
(setq tramp-default-method "ssh")

(require-package 'evil-leader)
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
  "SPC" 'evil-visual-line)

;;;;CONFIGS
; set python to use tabs instead of spaces
(add-hook 'python-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (setq python-indent 8)
    (setq tab-width 4)))

(setq inhibit-startup-message t)

(blink-cursor-mode 0)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(show-paren-mode 1)
