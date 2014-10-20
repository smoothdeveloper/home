;; I like having line numbers
(global-linum-mode t)

(require 'package)
;; add the original Emacs Lisp Package Archive
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
;; add the user-contributed repository
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

;; some auto-complete defaults
(require 'auto-complete-config)
(ac-config-default)
(setq ac-show-menu-immediately-on-auto-complete t)

;; define custom themes directory
(setq my-theme-dir "~/.emacs.d/themes")
(add-to-list 'load-path my-theme-dir)
(setq custom-theme-directory my-theme-dir)

;; hook haskell mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;; hook fsharp mode
(autoload 'fsharp-mode "fsharp-mode" "Major mode for editing F# code." t)
(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))

;; python stuff
(require 'jedi)
(add-to-list 'ac-sources 'ac-source-jedi-direct)
(add-hook 'python-mode-hook 'jedi:setup)

;; enable auto-complete every where (need to be updated with matching package directories)
(add-to-list 'load-path "~/.emacs.d/elpa/popup-0.5")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20130724.1750")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict")
(ac-config-default)

;; display line and column numbers
(setq column-number-mode t)
(setq global-linum-mode t)

;; enable Flycheck mode in all buffers, in which it can be used
(add-hook 'after-init-hook #'global-flycheck-mode)

;; folder containing additional plugins
(add-to-list 'load-path "~/.emacs.d/plugins")

;; speedbar
(require 'speedbar)
(speedbar-add-supported-extension ".hs")

;; rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; highlight matching parens/braces/...
(show-paren-mode 1)

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
