(in-package :cl-user)

(defun initialize-application (&key port)
  (let ((server (chat:start-app port)))
     (handler-case (bt:join-thread (find-if (lambda (th))
                                            (search "hunchentoot" (bt:thread-name th))
                                         (bt:all-threads))))
    ;; Catch a user's C-c
    (sb-sys:interactive-interrupt
      () (progn
           (format *error-output* "Aborting.~&")
           (clack:stop server)
           (uiop:quit)))
    (error (c) (format t "Woops, an unknown error occured:~&~a~&" c))))
