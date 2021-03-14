(in-package :cl-user)

(ql:quickload :chat)

(defun initialize-application (&key port)
  (chat:start-app port)

  (loop (sleep 60)))
