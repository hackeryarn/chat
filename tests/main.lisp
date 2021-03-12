(defpackage chat/tests/main
  (:use :cl
        :chat
        :rove))
(in-package :chat/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :chat)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
