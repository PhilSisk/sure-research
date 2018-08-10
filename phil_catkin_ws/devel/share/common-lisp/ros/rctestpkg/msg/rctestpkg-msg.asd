
(cl:in-package :asdf)

(defsystem "rctestpkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "currentTime" :depends-on ("_package_currentTime"))
    (:file "_package_currentTime" :depends-on ("_package"))
    (:file "LKdata" :depends-on ("_package_LKdata"))
    (:file "_package_LKdata" :depends-on ("_package"))
    (:file "TestTalkerMsg" :depends-on ("_package_TestTalkerMsg"))
    (:file "_package_TestTalkerMsg" :depends-on ("_package"))
    (:file "CarState" :depends-on ("_package_CarState"))
    (:file "_package_CarState" :depends-on ("_package"))
    (:file "IMUdata" :depends-on ("_package_IMUdata"))
    (:file "_package_IMUdata" :depends-on ("_package"))
    (:file "Motor_data" :depends-on ("_package_Motor_data"))
    (:file "_package_Motor_data" :depends-on ("_package"))
  ))