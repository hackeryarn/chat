(in-package :cl-user)

(defun initialize-application (&key port)
  (chat:start-app port))
