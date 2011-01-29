(add-to-list 'load-path "~/.emacs.d/")

(require 'geral)
(require 'ansi-color)
(require 'slim-mode)
(require 'flymake-ruby)
(require 'haml-mode)

(linum-mode t)

(add-hook 'ruby-mode-hook
	  (lambda ()
	    (local-set-key "\C-m" 'newline-and-indent)
	    (flymake-ruby-load)))

;; Interactive prompt
(ido-mode) 

;; Setar barra de rolagem para direita
(set-scroll-bar-mode 'right) 

;; Packages ELPA
;;(let ((buffer (url-retrieve-synchronously
;;	       "http://tromey.com/elpa/package-install.el")))
;;  (save-excursion
;;    (set-buffer buffer)
;;    (goto-char (point-min))
;;    (re-search-forward "^$" nil 'move)
;;    (eval-region (point) (point-max))
;;    (kill-buffer (current-buffer))))

(custom-set-variables
  '(ansi-color-for-comint-mode t)
  '(desktop-path (quote ("~/.emacs.d/")))
  '(desktop-save-mode t)
  '(recentf-mode t))

;; Configurações específicas por OS
(setq macosx-p (string-match "darwin" (symbol-name system-type)))
(setq linux-p (string-match "linux" (symbol-name system-type)))
(if macosx-p (load-file ".emacs.d/macos.el"))
(if linux-p (load-file ".emacs.d/linux.el"))

