(if (>= emacs-major-version 24)
    (message "")
  (load "~/.emacs.d/oldemacs.el"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'load-path "functions.el")
(package-initialize)

(add-to-list 'load-path "packages.el")
(add-to-list 'load-path "evil-config.el")


(setq-default ispell-program-name "aspell")

(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))


(global-surround-mode 1)

(ido-mode t)


(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

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
(add-hook 'sh-mode-hook 'indent-defaults)

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
