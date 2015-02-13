
; Base init
(load "~/.emacs.d/site-lisp/packages.el")

(defvar init-path (expand-file-name "~/.emacs.d/site-lisp"))
(add-to-list 'load-path "~/.emacs.d/site-lisp/modules")

;; Modules load
(autoload 'Rules "Rules" t)

;; Packages & Settings
(setq init-packages-path (expand-file-name "packages" init-path))
(setq
      init-settings-path (expand-file-name "settings" init-path)
      init-persistence-path (expand-file-name "persistence" init-path))
(defun find-subdirs-containing (dir pattern)
  (let* ((ret nil)
            (files (directory-files dir))
            (max-lisp-eval-depth 3000))
    (while files
      (let* ((file (car files))
                (path (expand-file-name file dir)))
          (if (and (file-directory-p path)
                  (not (string-match "^\\.+" file)))
              (setq ret (append ret (find-subdirs-containing path pattern)))
              (if (string-match pattern file)
                  (add-to-list 'ret dir))))
        (setq files (cdr files))) ret))
(defun add-init-path-to-load-path ()
  (interactive)
  (setq load-path (append (find-subdirs-containing init-settings-path "\\.el$")
                          (find-subdirs-containing init-packages-path "\\.el$")
                          (list init-path)
                          initial-load-path)))

;;  Add Packages to load path
(add-to-list 'load-path "~/.emacs.d/site-lisp/packages/")

;; Load Settings
(dolist
    (file (directory-files init-settings-path t "-settings\\.el$"))
    (condition-case e (load-file file) (error (warn "Error while loading settings file %s: %S" file (cdr e)))))

(provide 'init)

;; UTF8
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;;;

