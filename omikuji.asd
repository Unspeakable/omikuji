(in-package :cl-user)

(defpackage :omikuji.asd
  (:use :cl :asdf))
(in-package :omikuji.asd)

(defsystem :omikuji
  :author "Hiroyuki Tokunaga <inuzini.jiro@gmail.com>"
  :version "1.0.0"
  :description "おみくじ"
  :license "MIT"
  :components ((:file "omikuji")))

(defsystem :omikuji-test
  :description "おみくじ tests"
  :author "Hiroyuki Tokunaga <inuzini.jiro@gmail.com>"
  :license "MIT"
  :depends-on (:omikuji)
  :components ((:file "omikuji-test")))

(defmethod perform ((o test-op) (c (eql (find-system :omikuji))))
  (operate 'load-op :omikuji-test)
  (funcall (intern (symbol-name :run-all-tests) (find-package :omikuji-test))))
