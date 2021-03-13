(in-package :cl-user)

(defun initialize-application (&key port)
  (server (chat:start-app port))

  (loop (sleep 60)))
