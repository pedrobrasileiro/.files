(provide 'geral)

(defmacro maybe-require (package &rest body)
  "Tries to load the specified package. If it succeeds, then body is executed (if provided)."
  (if body
      `(progn
	 (if (require ,package nil t) 
	     (progn
	       ,@body)))
    `(require ,package nil t)))