

(require 'auto-highlight-symbol)

;; highlight symbol at point in all programming modes
(add-hook 'prog-mode-hook (lambda () (auto-highlight-symbol-mode t)))
