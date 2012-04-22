(add-to-list 'load-path "~/.emacs.d/")
; (add-to-list 'load-path "~/.emacs.d/twittering-mode/")
(add-to-list 'load-path "~/.emacs.d/titanium/")
(add-to-list 'load-path "~/.emacs.d/java-mode/")
(add-to-list 'load-path "~/.emacs.d/pivotal-tracker-mode/")

(require 'geral)
(require 'ansi-color)
(require 'slim-mode)
(require 'flymake-ruby)
(require 'haml-mode)
(require 'window-numbering)
(require 'go-mode)
(require 'pivotal-tracker)
; (require 'twittering-mode)
(require 'php-mode)
;; (require 'titanium)

;; (require 'java-mode-plus)
;; (require 'java-docs)

(global-auto-revert-mode t)
(global-linum-mode t)
;; (global-titanium t)
(window-numbering-mode t)
(setq ido-enable-flex-matching t)

;; Setando master-password para twit
(autoload 'alpaca-after-find-file "alpaca" nil t)
(add-hook 'find-file-hooks 'alpaca-after-find-file)
(setq twittering-use-master-password t)

(tool-bar-mode 0)
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
 '(pivotal-api-token "56a2d40b7457b12ccb7fb3da056061f4")
 '(recentf-mode t)
 '(timeclock-ask-before-exiting t)
 '(timeclock-modeline-display t nil (timeclock))
 '(timeclock-relative nil)
 '(timeclock-use-display-time t nil (time))
 '(timeclock-workday 32400))

;; Configurações específicas por OS
(setq macosx-p (string-match "darwin" (symbol-name system-type)))
(setq linux-p (string-match "linux" (symbol-name system-type)))

(if macosx-p (load-file "~/.emacs.d/macos.el"))
(if linux-p (load-file "~/.emacs.d/linux.el"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :height 120 :width normal))))
 '(linum ((t (:background "#141314" :foreground "#C0C0C0")))))
