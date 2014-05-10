;;;; Evil mode
;;;;;;;; Bootstrapper
(if (>= emacs-major-version 24)
    (message "")
  (load "~/.emacs.d/oldemacs.el"))

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

(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'ahk-mode)

(require 'org)
(require 'evil-org)
(require 'surround)
(global-surround-mode 1)

(require-package 'evil-nerd-commenter)
(require 'evil-nerd-commenter)

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
  "SPC" 'evil-visual-line
  "m" 'compile
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
)

(require-package 'markdown-mode)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;;;CONFIGS
; use tabs instead of spaces

(defun indent-defaults ()
  (setq indent-tabs-mode t)
  (setq tab-width 4)
  (setq indent-line-function 'insert-tab))

(add-hook 'python-mode-hook 'indent-defaults)
(add-hook 'java-mode-hook 'indent-defaults)
(add-hook 'c++-mode-hook 'indent-defaults)
(add-hook 'c-mode-hook 'indent-defaults)
(add-hook 'shell-mode-hook 'indent-defaults)

(setq inhibit-startup-message t)

(blink-cursor-mode 0)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(show-paren-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahk-syntax-directory "~/.emacs.d/plugins/ahk-mode/")
 '(magit-use-overlays nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq org-agenda-files '("~/org"))
(setq org-directory "~/org/")
(setq org-mobile-directory "~/Dropbox/mobileorg")
(setq org-mobile-inbox-for-pull "~/Dropbox/mobileorg/from-phone.org")

(add-hook 'org-mode-hook (lambda () (evil-leader/set-key 
				      "op" 'org-mobile-push
				      "ou" 'org-mobile-pull)))
