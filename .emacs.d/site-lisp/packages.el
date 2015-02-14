
;; define package repositories

(require 'package)
;; add the original Emacs Lisp Package Archive
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
;; add the user-contributed repository
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)


;; automatically install packages at startup
;; based on http://toumorokoshi.github.io/emacs-from-scratch-part-2-package-management.html


(require 'cl)

(defvar required-packages
  '(
					; emacs package management
					; package-filter
    
    
					; web stuff
					gh ; github
					twittering-mode
					erc-tweet         ; ERC add-in: show tweets
					erc-youtube       ; ERC add-in: show YT video details
					erc-image         ; ERC add-in: inline images
					erc-hl-nicks      ; ERC add-in: highlight nicknames
    
    nlinum ; better line number mode


					; fly-check + enhancements
    flycheck
					;flycheck-pos-tip

    
					;evil             ; Vim emulation (disabled for now)
    tabbar            ; tab switching for Emacs
    tabbar-ruler      ; tab switching for Emacs
    multiple-cursors  ; multi-line editing made easier
    helm              ; auto-completing popup system
    smart-tab         ; tab completion and more
					; dpaste_de         ; put the current buffer to the web
					; yasnippet         ; easy snippet handling (disabled for now)
    sr-speedbar       ; sidebar as a buffer
    todotxt           ; todo.txt support
					; emmet-mode        ; Zen Coding
					; browse-kill-ring  ; a more useful kill-ring experience
					; web-mode          ; multiple modes
					; scss-mode         ; SCSS
    magit

    rainbow-delimiters ; nifty colored pairs
    
    fsharp-mode
    
    jedi
					; color themes:
    zenburn-theme     ; most eye-pleasant coding theme available

					; some modes
    markdown-mode     ; Markdown support

    
    dash              ; required by helm (and probably others)
    org               ; org-mode

					; Gnus extensions:
    bbdb              ; Big Brother database
    bbdb-ext          ; ... with extras


					; Haskell stuff
					haskell-mode
					flycheck-ghcmod
					flycheck-haskell
					flycheck-hdevtools
					;ac-haskell-process ;      Haskell auto-complete source which uses the current haskell process
					ghc
					ghc-imported-from
					ghci-completion
					;haskell-emacs
					;hi2
    hindent
    scion
    shm        ; Structured Haskell Mode
    

					; Elisp stuff
					;flycheck-package


    ) "a list of packages to ensure are installed at launch.")

					; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

					; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
					; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
					; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; Quick access to the package updater:
(defun update-packages ()
  (interactive)
  (package-refresh-contents)
  (package-list-packages)
  (package-menu-mark-upgrades)
  (package-menu-execute)
  (byte-compile-init-dir))
