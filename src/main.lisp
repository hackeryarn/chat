(defpackage chat
  (:use :cl :clog)
  (:export start-app))
(in-package :chat)

(defun start-app ()
  (run-demo 02))
