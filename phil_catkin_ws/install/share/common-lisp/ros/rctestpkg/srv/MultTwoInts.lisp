; Auto-generated. Do not edit!


(cl:in-package rctestpkg-srv)


;//! \htmlinclude MultTwoInts-request.msg.html

(cl:defclass <MultTwoInts-request> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:integer
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:integer
    :initform 0))
)

(cl:defclass MultTwoInts-request (<MultTwoInts-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MultTwoInts-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MultTwoInts-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-srv:<MultTwoInts-request> is deprecated: use rctestpkg-srv:MultTwoInts-request instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <MultTwoInts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:a-val is deprecated.  Use rctestpkg-srv:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <MultTwoInts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:b-val is deprecated.  Use rctestpkg-srv:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MultTwoInts-request>) ostream)
  "Serializes a message object of type '<MultTwoInts-request>"
  (cl:let* ((signed (cl:slot-value msg 'a)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'b)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MultTwoInts-request>) istream)
  "Deserializes a message object of type '<MultTwoInts-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'b) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MultTwoInts-request>)))
  "Returns string type for a service object of type '<MultTwoInts-request>"
  "rctestpkg/MultTwoIntsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultTwoInts-request)))
  "Returns string type for a service object of type 'MultTwoInts-request"
  "rctestpkg/MultTwoIntsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MultTwoInts-request>)))
  "Returns md5sum for a message object of type '<MultTwoInts-request>"
  "1f3af93331fc1032113dd90d9a5f0755")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MultTwoInts-request)))
  "Returns md5sum for a message object of type 'MultTwoInts-request"
  "1f3af93331fc1032113dd90d9a5f0755")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MultTwoInts-request>)))
  "Returns full string definition for message of type '<MultTwoInts-request>"
  (cl:format cl:nil "int64 a~%int64 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MultTwoInts-request)))
  "Returns full string definition for message of type 'MultTwoInts-request"
  (cl:format cl:nil "int64 a~%int64 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MultTwoInts-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MultTwoInts-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MultTwoInts-request
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
))
;//! \htmlinclude MultTwoInts-response.msg.html

(cl:defclass <MultTwoInts-response> (roslisp-msg-protocol:ros-message)
  ((product
    :reader product
    :initarg :product
    :type cl:integer
    :initform 0))
)

(cl:defclass MultTwoInts-response (<MultTwoInts-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MultTwoInts-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MultTwoInts-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-srv:<MultTwoInts-response> is deprecated: use rctestpkg-srv:MultTwoInts-response instead.")))

(cl:ensure-generic-function 'product-val :lambda-list '(m))
(cl:defmethod product-val ((m <MultTwoInts-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:product-val is deprecated.  Use rctestpkg-srv:product instead.")
  (product m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MultTwoInts-response>) ostream)
  "Serializes a message object of type '<MultTwoInts-response>"
  (cl:let* ((signed (cl:slot-value msg 'product)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MultTwoInts-response>) istream)
  "Deserializes a message object of type '<MultTwoInts-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'product) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MultTwoInts-response>)))
  "Returns string type for a service object of type '<MultTwoInts-response>"
  "rctestpkg/MultTwoIntsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultTwoInts-response)))
  "Returns string type for a service object of type 'MultTwoInts-response"
  "rctestpkg/MultTwoIntsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MultTwoInts-response>)))
  "Returns md5sum for a message object of type '<MultTwoInts-response>"
  "1f3af93331fc1032113dd90d9a5f0755")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MultTwoInts-response)))
  "Returns md5sum for a message object of type 'MultTwoInts-response"
  "1f3af93331fc1032113dd90d9a5f0755")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MultTwoInts-response>)))
  "Returns full string definition for message of type '<MultTwoInts-response>"
  (cl:format cl:nil "int64 product~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MultTwoInts-response)))
  "Returns full string definition for message of type 'MultTwoInts-response"
  (cl:format cl:nil "int64 product~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MultTwoInts-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MultTwoInts-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MultTwoInts-response
    (cl:cons ':product (product msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MultTwoInts)))
  'MultTwoInts-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MultTwoInts)))
  'MultTwoInts-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultTwoInts)))
  "Returns string type for a service object of type '<MultTwoInts>"
  "rctestpkg/MultTwoInts")