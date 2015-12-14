(defpackage :omikuji
  (:use :common-lisp)
  (:export :dinner))
(in-package :omikuji)

(defun %load-kuji (kuji)
  (with-open-file (in (merge-pathnames
					     (concatenate 'string kuji ".lisp")
						 (merge-pathnames
						    "kuji/"
							(asdf:system-source-directory :omikuji)))
					  :external-format :utf-8)
	(read in)))

(defmacro def-omikuji (name)
  (let ((kuji (gensym)))
	`(defun ,name ()
	   (let ((,kuji (%load-kuji (string-downcase ',name))))
		 (nth (random (length ,kuji)) ,kuji)))))

(def-omikuji dinner)
