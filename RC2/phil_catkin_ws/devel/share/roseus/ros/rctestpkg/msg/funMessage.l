;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::funMessage)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'funMessage (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::FUNMESSAGE")
  (make-package "RCTESTPKG::FUNMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude funMessage.msg.html


(defclass rctestpkg::funMessage
  :super ros::object
  :slots (_msg ))

(defmethod rctestpkg::funMessage
  (:init
   (&key
    ((:msg __msg) "")
    )
   (send-super :init)
   (setq _msg (string __msg))
   self)
  (:msg
   (&optional __msg)
   (if __msg (setq _msg __msg)) _msg)
  (:serialization-length
   ()
   (+
    ;; string _msg
    4 (length _msg)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _msg
       (write-long (length _msg) s) (princ _msg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get rctestpkg::funMessage :md5sum-) "7d96ed730776804754140b85e64c862e")
(setf (get rctestpkg::funMessage :datatype-) "rctestpkg/funMessage")
(setf (get rctestpkg::funMessage :definition-)
      "string msg

")



(provide :rctestpkg/funMessage "7d96ed730776804754140b85e64c862e")


