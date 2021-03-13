(in-package :cl-user)

(print ">>> Building system....")

(push *build-dir* asdf:*central-registry*)

(ql:quickload :chat)

(defun heroku-toplevel ()
  (let ((port (parse-integer (heroku-getenv "PORT"))))
    (format t "Listening on port ~A~%" port)
    (chat:start-app port))
  (loop (sleep 60)))

(print ">>> Done building system")
