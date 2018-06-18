; Auto-generated. Do not edit!


(cl:in-package rctestpkg-msg)


;//! \htmlinclude currentTime.msg.html

(cl:defclass <currentTime> (roslisp-msg-protocol:ros-message)
  ((time
    :reader time
    :initarg :time
    :type cl:integer
    :initform 0))
)

(cl:defclass currentTime (<currentTime>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <currentTime>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'currentTime)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-msg:<currentTime> is deprecated: use rctestpkg-msg:currentTime instead.")))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <currentTime>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:time-val is deprecated.  Use rctestpkg-msg:time instead.")
  (time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <currentTime>) ostream)
  "Serializes a message object of type '<currentTime>"
  (cl:let* ((signed (cl:slot-value msg 'time)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <currentTime>) istream)
  "Deserializes a message object of type '<currentTime>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<currentTime>)))
  "Returns string type for a message object of type '<currentTime>"
  "rctestpkg/currentTime")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'currentTime)))
  "Returns string type for a message object of type 'currentTime"
  "rctestpkg/currentTime")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<currentTime>)))
  "Returns md5sum for a message object of type '<currentTime>"
  "50be640c11c45b7adcb0b6b7fbf3f928")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'currentTime)))
  "Returns md5sum for a message object of type 'currentTime"
  "50be640c11c45b7adcb0b6b7fbf3f928")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<currentTime>)))
  "Returns full string definition for message of type '<currentTime>"
  (cl:format cl:nil "int64 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'currentTime)))
  "Returns full string definition for message of type 'currentTime"
  (cl:format cl:nil "int64 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <currentTime>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <currentTime>))
  "Converts a ROS message object to a list"
  (cl:list 'currentTime
    (cl:cons ':time (time msg))
))
