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

(defun bury-compile-buffer-if-successful (buffer string)
"Bury a compilation buffer if succeeded without warnings "
	(if (and
			(string-match "compilation" (buffer-name buffer))
			(string-match "finished" string)
			(not
				(with-current-buffer buffer
				(search-forward "warning" nil t))))
		(run-with-timer 1 nil
			(lambda (buf)
				(bury-buffer buf)
				(switch-to-prev-buffer (get-buffer-window buf) 'kill))
			buffer)))

(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)
