;;; Commentary 
;; setup melpa
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4c756e27a179b91d3c0227a8050aabbde3ba3f1d5ed4548cbba77214729e0f34" default)))
 '(package-selected-packages
   (quote
    (yasnippet-snippets yasnippet what-the-commit json-mode flycheck-demjsonlint live-py-mode homebrew-mode highlight-parentheses highlight-operators groovy-mode pyvenv bug-hunter git-commit git-blamed git-auto-commit-mode gist fortune-cookie flymake-yaml flymake-shell flymake-python-pyflakes flycheck-pyflakes flycheck-color-mode-line flycheck egg dummyparens company-shell company-go company-ansible company comment-dwim-2 color-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; set custom themes directory
(add-to-list 'custom-theme-load-path "/Users/moses/.emacs.d/themes")
'(custom-enabled-themes (quote (gnome2)))
(load-theme 'gnome2)

;; enable plugins loaded from melpa
;; comment dwim 2
(global-set-key (kbd "M-;") 'comment-dwim-2)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
(require 'flycheck-pyflakes)
(add-hook 'python-mode-hook 'flycheck-mode)

;; flymake
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(require 'flymake-shell)
(add-hook 'sh-set-shell-hook 'flymake-shell-load)
(add-hook 'yaml-mode-hook 'flymake-yaml-load)

;; other enables
(require 'highlight-parentheses)
(require 'live-py-mode)

;; json-snatcher 
(defun js-mode-bindings ()
"Sets a hotkey for using the json-snatcher plugin"
	 (when (string-match  "\\.json$" (buffer-name))
        (local-set-key (kbd "C-c C-g") 'jsons-print-path)))
(add-hook 'js-mode-hook 'js-mode-bindings)
(add-hook 'js2-mode-hook 'js-mode-bindings)

;;(provide '.emacs)\n;;; .emacs ends here

