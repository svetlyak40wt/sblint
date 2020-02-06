#+sbcl
(defsystem "sblint"
  :version "0.1.4"
  :author "Eitaro Fukamachi"
  :license "BSD 2-Clause"
  :depends-on ("swank"
               "uiop")
  :components ((:module "src"
                :components
                ((:file "sblint" :depends-on ("file-location" "error" "logger" "util"))
                 (:file "file-location")
                 (:file "logger")
                 (:file "error")
                 (:file "util"))))
  :description "A linter for Common Lisp source code using SBCL"
  :in-order-to ((test-op (test-op "sblint-test"))))
#-sbcl
(error "SBLint requires SBCL")

(defsystem "sblint-test"
  :depends-on ("sblint" "rove" "split-sequence")
  :serial t
  :pathname "tests"
  :components ((:file "sblint"))
  :perform (test-op (o c) (symbol-call :rove '#:run c)))
