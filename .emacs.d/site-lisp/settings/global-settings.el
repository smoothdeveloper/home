;; display line and column numbers
(setq column-number-mode t)
(setq global-linum-mode t)

;; reload files that have been changed outside
(setq global-auto-revert-mode t)

;; no startup screen
(setq inhibit-startup-message t)

(require 'package)
;; add the original Emacs Lisp Package Archive
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
;; add the user-contributed repository
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

;; change font size with ctrl + mousewheel
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)

;; recent files
(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15)
(recentf-mode +1)

;; define custom themes directory
(setq my-theme-dir "~/.emacs.d/themes")
(add-to-list 'load-path my-theme-dir)
(setq custom-theme-directory my-theme-dir)

;; folder containing additional plugins
(add-to-list 'load-path "~/.emacs.d/plugins")

;; rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; highlight matching parens/braces/...
(setq show-paren-mode 1)

;; speedbar
(require 'speedbar)
(speedbar-add-supported-extension ".hs")
(speedbar-add-supported-extension ".el")
