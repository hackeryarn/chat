(in-package :cl-user)

(ql:quickload :chat)

(defun initialize-application (&key port)
  (server (chat:start-app port))
  (loop (sleep 60)))
