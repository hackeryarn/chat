(defsystem "chat"
  :version "0.1.0"
  :author "hackeryarn"
  :license "MIT"
  :depends-on ("clog")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "chat/tests"))))

(defsystem "chat/tests"
  :author ""
  :license ""
  :depends-on ("chat"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for chat"
  :perform (test-op (op c) (symbol-call :rove :run c)))
