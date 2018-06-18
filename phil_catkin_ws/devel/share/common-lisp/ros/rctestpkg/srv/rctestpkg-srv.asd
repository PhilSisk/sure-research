
(cl:in-package :asdf)

(defsystem "rctestpkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MultTwoInts" :depends-on ("_package_MultTwoInts"))
    (:file "_package_MultTwoInts" :depends-on ("_package"))
  ))