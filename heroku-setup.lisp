(in-package :cl-user)

(print ">>> Building system....")

(load (make-pathname :directory *build-dir* :defaults "chat.asd"))

(ql:quickload :chat)

(defun heroku-toplevel ()
  (let ((port (parse-integer (heroku-getenv "PORT"))))
    (format t "Listening on port ~A~%" port)
    (funcall (symbol-function (find-symbol 'start-app (find-package 'chat)))
             port))
  (loop (sleep 60)))

(print ">>> Done building system")
