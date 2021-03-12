(in-package :cl-user)

(print ">>> Building system....")

(require 'asdf)

(load (merge-pathnames "chat.asd" *build-dir*))
(load (merge-pathnames "src/main.lisp" *build-dir*))
(defun heroku-toplevel ()
  (let ((port (parse-integer (heroku-getenv "PORT"))))
    (format t "Listening on port ~A~%" port)
    (funcall (symbol-function (find-symbol 'start-app (find-package 'chat)))
             port))
  (loop (sleep 60)))
(print ">>> Done building system")
