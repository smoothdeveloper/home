(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(if (eq system-type 'windows-nt)
    ;; do windows stuff

    (setq-default fstar-executable "C:/dev/src/github.com/FStar/FStar/bin/fstar.exe")
    (setq-default fstar-smt-executable "C:/dev/bin/z3-4.8.5-x64-win/bin/z3.exe")

    (custom-set-faces
     '(default ((t (:family "Envy Code R" :foundry "outline" :slant normal :weight normal :height 90 :width normal))))
     )
 )

(if (eq system-type 'darwin)
    ;; do macos stuff
    (setq-default fstar-executable "~/dev/src/github.com/FStarLang/FStar/bin/fstar.exe")
    (setq-default fstar-smt-executable "~/dev/src/github.com/Z3Prover/z3/build/z3")

)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(fstar-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
