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
      recentf-max-menu-items 35)
(recentf-mode +1)

;; define custom themes directory
(defvar my-theme-dir)
(my-theme-dir "~/.emacs.d/themes")
(add-to-list 'load-path my-theme-dir)
(setq custom-theme-directory my-theme-dir)

;; folder containing additional plugins
(add-to-list 'load-path "~/.emacs.d/plugins")

;; rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; highlight matching parens/braces/...
(show-paren-mode t)
(show-paren-delay 0) ; no delay

;; speedbar
(require 'speedbar)
(speedbar-add-supported-extension ".hs")
(speedbar-add-supported-extension ".el")

;; Assume new files as modified:
(add-hook
 'find-file-hooks
 (lambda ()
   (when (not (file-exists-p (buffer-file-name)))
     (set-buffer-modified-p t))))

;; Add a sane tab completion:
(require 'smart-tab)                     ; requires the smart-tab package.
(global-smart-tab-mode 1)

;; Add a neat sidebar for easier directory/project browsing:
(require 'sr-speedbar)                             ; requires the sr-speedbar package.
(global-set-key (kbd "M-s") 'sr-speedbar-toggle)   ; this shortcut was still free.
(sr-speedbar-open)                                 ; open it right away

;;; 
