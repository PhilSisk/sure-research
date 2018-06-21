; Auto-generated. Do not edit!


(cl:in-package rctestpkg-msg)


;//! \htmlinclude funMessage.msg.html

(cl:defclass <funMessage> (roslisp-msg-protocol:ros-message)
  ((msg
    :reader msg
    :initarg :msg
    :type cl:string
    :initform ""))
)

(cl:defclass funMessage (<funMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <funMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'funMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-msg:<funMessage> is deprecated: use rctestpkg-msg:funMessage instead.")))

(cl:ensure-generic-function 'msg-val :lambda-list '(m))
(cl:defmethod msg-val ((m <funMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:msg-val is deprecated.  Use rctestpkg-msg:msg instead.")
  (msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <funMessage>) ostream)
  "Serializes a message object of type '<funMessage>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <funMessage>) istream)
  "Deserializes a message object of type '<funMessage>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<funMessage>)))
  "Returns string type for a message object of type '<funMessage>"
  "rctestpkg/funMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'funMessage)))
  "Returns string type for a message object of type 'funMessage"
  "rctestpkg/funMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<funMessage>)))
  "Returns md5sum for a message object of type '<funMessage>"
  "7d96ed730776804754140b85e64c862e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'funMessage)))
  "Returns md5sum for a message object of type 'funMessage"
  "7d96ed730776804754140b85e64c862e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<funMessage>)))
  "Returns full string definition for message of type '<funMessage>"
  (cl:format cl:nil "string msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'funMessage)))
  "Returns full string definition for message of type 'funMessage"
  (cl:format cl:nil "string msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <funMessage>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <funMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'funMessage
    (cl:cons ':msg (msg msg))
))
