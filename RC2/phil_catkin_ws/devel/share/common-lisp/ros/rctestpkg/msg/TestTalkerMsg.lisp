; Auto-generated. Do not edit!


(cl:in-package rctestpkg-msg)


;//! \htmlinclude TestTalkerMsg.msg.html

(cl:defclass <TestTalkerMsg> (roslisp-msg-protocol:ros-message)
  ((TestTalkerString
    :reader TestTalkerString
    :initarg :TestTalkerString
    :type cl:string
    :initform "")
   (TestTalkerInt
    :reader TestTalkerInt
    :initarg :TestTalkerInt
    :type cl:integer
    :initform 0))
)

(cl:defclass TestTalkerMsg (<TestTalkerMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TestTalkerMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TestTalkerMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-msg:<TestTalkerMsg> is deprecated: use rctestpkg-msg:TestTalkerMsg instead.")))

(cl:ensure-generic-function 'TestTalkerString-val :lambda-list '(m))
(cl:defmethod TestTalkerString-val ((m <TestTalkerMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:TestTalkerString-val is deprecated.  Use rctestpkg-msg:TestTalkerString instead.")
  (TestTalkerString m))

(cl:ensure-generic-function 'TestTalkerInt-val :lambda-list '(m))
(cl:defmethod TestTalkerInt-val ((m <TestTalkerMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:TestTalkerInt-val is deprecated.  Use rctestpkg-msg:TestTalkerInt instead.")
  (TestTalkerInt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TestTalkerMsg>) ostream)
  "Serializes a message object of type '<TestTalkerMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'TestTalkerString))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'TestTalkerString))
  (cl:let* ((signed (cl:slot-value msg 'TestTalkerInt)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TestTalkerMsg>) istream)
  "Deserializes a message object of type '<TestTalkerMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'TestTalkerString) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'TestTalkerString) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'TestTalkerInt) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TestTalkerMsg>)))
  "Returns string type for a message object of type '<TestTalkerMsg>"
  "rctestpkg/TestTalkerMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TestTalkerMsg)))
  "Returns string type for a message object of type 'TestTalkerMsg"
  "rctestpkg/TestTalkerMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TestTalkerMsg>)))
  "Returns md5sum for a message object of type '<TestTalkerMsg>"
  "f02eee63b61a8f52d495bcf6a0b81c9a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TestTalkerMsg)))
  "Returns md5sum for a message object of type 'TestTalkerMsg"
  "f02eee63b61a8f52d495bcf6a0b81c9a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TestTalkerMsg>)))
  "Returns full string definition for message of type '<TestTalkerMsg>"
  (cl:format cl:nil "string TestTalkerString~%int64 TestTalkerInt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TestTalkerMsg)))
  "Returns full string definition for message of type 'TestTalkerMsg"
  (cl:format cl:nil "string TestTalkerString~%int64 TestTalkerInt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TestTalkerMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'TestTalkerString))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TestTalkerMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'TestTalkerMsg
    (cl:cons ':TestTalkerString (TestTalkerString msg))
    (cl:cons ':TestTalkerInt (TestTalkerInt msg))
))
