; Auto-generated. Do not edit!


(cl:in-package rctestpkg-srv)


;//! \htmlinclude ComputeControl-request.msg.html

(cl:defclass <ComputeControl-request> (roslisp-msg-protocol:ros-message)
  ((v
    :reader v
    :initarg :v
    :type cl:float
    :initform 0.0)
   (h
    :reader h
    :initarg :h
    :type cl:float
    :initform 0.0)
   (vl
    :reader vl
    :initarg :vl
    :type cl:float
    :initform 0.0))
)

(cl:defclass ComputeControl-request (<ComputeControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ComputeControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ComputeControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-srv:<ComputeControl-request> is deprecated: use rctestpkg-srv:ComputeControl-request instead.")))

(cl:ensure-generic-function 'v-val :lambda-list '(m))
(cl:defmethod v-val ((m <ComputeControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:v-val is deprecated.  Use rctestpkg-srv:v instead.")
  (v m))

(cl:ensure-generic-function 'h-val :lambda-list '(m))
(cl:defmethod h-val ((m <ComputeControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:h-val is deprecated.  Use rctestpkg-srv:h instead.")
  (h m))

(cl:ensure-generic-function 'vl-val :lambda-list '(m))
(cl:defmethod vl-val ((m <ComputeControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:vl-val is deprecated.  Use rctestpkg-srv:vl instead.")
  (vl m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ComputeControl-request>) ostream)
  "Serializes a message object of type '<ComputeControl-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'v))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'h))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vl))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ComputeControl-request>) istream)
  "Deserializes a message object of type '<ComputeControl-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'h) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vl) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ComputeControl-request>)))
  "Returns string type for a service object of type '<ComputeControl-request>"
  "rctestpkg/ComputeControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ComputeControl-request)))
  "Returns string type for a service object of type 'ComputeControl-request"
  "rctestpkg/ComputeControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ComputeControl-request>)))
  "Returns md5sum for a message object of type '<ComputeControl-request>"
  "99cbc1e3badf94dc8e3459eb691661ab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ComputeControl-request)))
  "Returns md5sum for a message object of type 'ComputeControl-request"
  "99cbc1e3badf94dc8e3459eb691661ab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ComputeControl-request>)))
  "Returns full string definition for message of type '<ComputeControl-request>"
  (cl:format cl:nil "float64 v~%float64 h~%float64 vl~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ComputeControl-request)))
  "Returns full string definition for message of type 'ComputeControl-request"
  (cl:format cl:nil "float64 v~%float64 h~%float64 vl~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ComputeControl-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ComputeControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ComputeControl-request
    (cl:cons ':v (v msg))
    (cl:cons ':h (h msg))
    (cl:cons ':vl (vl msg))
))
;//! \htmlinclude ComputeControl-response.msg.html

(cl:defclass <ComputeControl-response> (roslisp-msg-protocol:ros-message)
  ((u
    :reader u
    :initarg :u
    :type cl:float
    :initform 0.0))
)

(cl:defclass ComputeControl-response (<ComputeControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ComputeControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ComputeControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-srv:<ComputeControl-response> is deprecated: use rctestpkg-srv:ComputeControl-response instead.")))

(cl:ensure-generic-function 'u-val :lambda-list '(m))
(cl:defmethod u-val ((m <ComputeControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:u-val is deprecated.  Use rctestpkg-srv:u instead.")
  (u m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ComputeControl-response>) ostream)
  "Serializes a message object of type '<ComputeControl-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'u))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ComputeControl-response>) istream)
  "Deserializes a message object of type '<ComputeControl-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ComputeControl-response>)))
  "Returns string type for a service object of type '<ComputeControl-response>"
  "rctestpkg/ComputeControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ComputeControl-response)))
  "Returns string type for a service object of type 'ComputeControl-response"
  "rctestpkg/ComputeControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ComputeControl-response>)))
  "Returns md5sum for a message object of type '<ComputeControl-response>"
  "99cbc1e3badf94dc8e3459eb691661ab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ComputeControl-response)))
  "Returns md5sum for a message object of type 'ComputeControl-response"
  "99cbc1e3badf94dc8e3459eb691661ab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ComputeControl-response>)))
  "Returns full string definition for message of type '<ComputeControl-response>"
  (cl:format cl:nil "float64 u~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ComputeControl-response)))
  "Returns full string definition for message of type 'ComputeControl-response"
  (cl:format cl:nil "float64 u~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ComputeControl-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ComputeControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ComputeControl-response
    (cl:cons ':u (u msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ComputeControl)))
  'ComputeControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ComputeControl)))
  'ComputeControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ComputeControl)))
  "Returns string type for a service object of type '<ComputeControl>"
  "rctestpkg/ComputeControl")