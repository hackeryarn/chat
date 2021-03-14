(in-package :cl-user)

(defun initialize-application (&key port)
  (chat:start-app port)

  ;; Pre build binary will quit right after execution.
  ;; To keep the server running, we bind the main thread to the "hunchentoot" thread
  (handler-case (bt:join-thread (find-if
                                   (lambda (th)
                                     (search "hunchentoot" (bt:thread-name th)))
                                   (bt:all-threads)))
    ;; Handles C-c interupt.
    ;; Heroku will use this to sleep the server when inactive
    (#+sbcl sb-sys:interactive-interrupt
          #+ccl  ccl:interrupt-signal-condition
          #+clisp system::simple-interrupt-condition
          #+ecl ext:interactive-interrupt
          #+allegro excl:interrupt-signal
          () (progn
               (format *error-output "Aboring.~&")
               (uiop:quit))
        (error (c) (format t "An unknown error occured: ~&~a~&" c)))))
