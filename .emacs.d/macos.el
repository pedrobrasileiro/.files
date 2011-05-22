;; Configurações específicas no Mac OS X

(require 'color-theme)
(load-file "~/.emacs.d/themes/twilight.el")

(color-theme-twilight)

(custom-set-faces
  '(default ((t (:inherit nil :stipple nil :height 120 :width normal)))))

(load-file "~/.emacs.d/maxframe/maxframe.el")
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)