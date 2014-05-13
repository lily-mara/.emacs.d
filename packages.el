;DOWNLOAD
(require-package 'evil)
(require-package 'git-gutter)
(require-package 'monokai-theme)
(require-package 'magit)
(require-package 'markdown-mode)
(require-package 'evil-leader)
(require-package 'jedi)

;INITIALIZE
(require 'evil)
(require 'evil-leader)
(require 'ahk-mode)
(require 'org)
(require 'evil-org)
(require 'surround)
(require 'ido)
(require 'evil-nerd-commenter)
(require 'tramp)
(require 'magit)
(require 'arduino-mode)

;CONFIGS
(global-git-gutter-mode +1)
(load-theme 'monokai t)
(setq tramp-default-method "ssh")

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
