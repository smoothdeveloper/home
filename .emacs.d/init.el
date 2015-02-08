
; https://github.com/Heather/clarity/blob/master/init.el

;; Load all the stuff
(setq init-path (expand-file-name "~/.emacs.d/site-lisp"))
(load-file (expand-file-name "init.el" init-path))

;; Client - Server hack for windows
(when (eq system-type 'windows-nt)
    (load "server")
    (unless (server-running-p) (server-start))

    ;; Hiding the form instead of closing it.
    (defun hide-form ()
        (interactive)
        (server-edit)
        (make-frame-invisible nil t))
    (global-set-key (kbd "C-x C-c") 'hide-form))

;; auto generated custom-set stuff

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(background-color "#002b36")
 '(background-mode dark)
 '(column-number-mode t)
 '(cursor-color "#839496")
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes (quote ("33818a647c8d514de4571b7263ece9003fd4239807968bd501152c0643251857" "a6d39b3e27d45aea4bf0c20a9f6ccbff858eae1728ac0cf72d6a86bd873202d2" default)))
 '(foreground-color "#839496")
 '(ghc-core-program-args (quote ("-threaded" "-O2")))
 '(haskell-font-lock-haddock t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Envy Code R" :foundry "outline" :slant normal :weight normal :height 90 :width normal))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#C071E1"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#8371E1"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#719BE1"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#71DDE1"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#71E19B"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#8EE171"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#D8E171"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#E1A071"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#E17471"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "orange red")))))

;;
