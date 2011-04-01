(add-to-list 'load-path "~/.emacs.d/")

(require 'geral)
(require 'ansi-color)
(require 'slim-mode)
(require 'flymake-ruby)
(require 'haml-mode)
(require 'window-numbering)
(require 'go-mode)

(global-auto-revert-mode t)
(global-linum-mode t)
(window-numbering-mode t)
(setq ido-enable-flex-matching t)
(tool-bar-mode nil)
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
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ansi-color-for-comint-mode t)
 '(desktop-path (quote ("~/.emacs.d/")))
 '(desktop-save-mode t)
 '(recentf-mode t)
 '(timeclock-ask-before-exiting t)
 '(timeclock-modeline-display t nil (timeclock))
 '(timeclock-relative nil)
 '(timeclock-use-display-time t nil (time))
 '(timeclock-workday 32400))

;; Configurações específicas por OS
(setq macosx-p (string-match "darwin" (symbol-name system-type)))
(setq linux-p (string-match "linux" (symbol-name system-type)))
(if macosx-p (load-file ".emacs.d/macos.el"))
(if linux-p (load-file ".emacs.d/linux.el"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :height 100 :width normal))))
 '(linum ((t (:background "#141314" :foreground "#C0C0C0")))))
