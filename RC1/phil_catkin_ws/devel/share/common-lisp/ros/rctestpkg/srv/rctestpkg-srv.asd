
(cl:in-package :asdf)

(defsystem "rctestpkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MPC_ACC" :depends-on ("_package_MPC_ACC"))
    (:file "_package_MPC_ACC" :depends-on ("_package"))
    (:file "MPC_CC" :depends-on ("_package_MPC_CC"))
    (:file "_package_MPC_CC" :depends-on ("_package"))
    (:file "MultTwoInts" :depends-on ("_package_MultTwoInts"))
    (:file "_package_MultTwoInts" :depends-on ("_package"))
    (:file "MPC_LK" :depends-on ("_package_MPC_LK"))
    (:file "_package_MPC_LK" :depends-on ("_package"))
    (:file "ComputeControl" :depends-on ("_package_ComputeControl"))
    (:file "_package_ComputeControl" :depends-on ("_package"))
  ))