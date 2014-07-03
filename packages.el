;;; Emacs is not a package manager, and here we load its package manager!
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ;; TODO: Maybe, use this after emacs24 is released
                  ;; (development versions of packages)
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)

;;; Required packages
;;; everytime emacs starts, it will automatically check if those packages are
;;; missing, it will install them automatically
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar tmtxt/packages
  '(evil git-gutter monokai-theme magit markdown-mode evil-leader jedi evil-surround arduino-mode evil-nerd-commenter zeal-at-point))

(dolist (p tmtxt/packages)
	  (when (not (package-installed-p p))
		(package-install p))
	  (require p))


(require 'evil-org)
(require 'ido)
(require 'org)
(require 'tramp)

;CONFIGS
(global-git-gutter-mode +1)
(load-theme 'monokai t)
(setq tramp-default-method "ssh")

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
