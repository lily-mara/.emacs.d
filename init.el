(if (>= emacs-major-version 24)
    (message "")
  (load "~/.emacs.d/oldemacs.el"))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))

(load "~/.emacs.d/functions.el")
(package-initialize)

(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/evil-config.el")

(setq-default ispell-program-name "aspell")

(global-evil-surround-mode 1)

(ido-mode t)

;;;;CONFIGS
; use tabs instead of spaces
(global-set-key (kbd "TAB") 'self-insert-command)

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
 '(magit-use-overlays nil)
 '(tab-width 4)
 '(indent-tabs-mode t))

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
