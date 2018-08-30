; Auto-generated. Do not edit!


(cl:in-package rctestpkg-srv)


;//! \htmlinclude MPC_CC-request.msg.html

(cl:defclass <MPC_CC-request> (roslisp-msg-protocol:ros-message)
  ((vr
    :reader vr
    :initarg :vr
    :type cl:float
    :initform 0.0)
   (u0
    :reader u0
    :initarg :u0
    :type cl:float
    :initform 0.0)
   (i0
    :reader i0
    :initarg :i0
    :type cl:float
    :initform 0.0)
   (wv
    :reader wv
    :initarg :wv
    :type cl:float
    :initform 0.0)
   (wi
    :reader wi
    :initarg :wi
    :type cl:float
    :initform 0.0)
   (i_max
    :reader i_max
    :initarg :i_max
    :type cl:float
    :initform 0.0)
   (i_min
    :reader i_min
    :initarg :i_min
    :type cl:float
    :initform 0.0))
)

(cl:defclass MPC_CC-request (<MPC_CC-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MPC_CC-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MPC_CC-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-srv:<MPC_CC-request> is deprecated: use rctestpkg-srv:MPC_CC-request instead.")))

(cl:ensure-generic-function 'vr-val :lambda-list '(m))
(cl:defmethod vr-val ((m <MPC_CC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:vr-val is deprecated.  Use rctestpkg-srv:vr instead.")
  (vr m))

(cl:ensure-generic-function 'u0-val :lambda-list '(m))
(cl:defmethod u0-val ((m <MPC_CC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:u0-val is deprecated.  Use rctestpkg-srv:u0 instead.")
  (u0 m))

(cl:ensure-generic-function 'i0-val :lambda-list '(m))
(cl:defmethod i0-val ((m <MPC_CC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:i0-val is deprecated.  Use rctestpkg-srv:i0 instead.")
  (i0 m))

(cl:ensure-generic-function 'wv-val :lambda-list '(m))
(cl:defmethod wv-val ((m <MPC_CC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:wv-val is deprecated.  Use rctestpkg-srv:wv instead.")
  (wv m))

(cl:ensure-generic-function 'wi-val :lambda-list '(m))
(cl:defmethod wi-val ((m <MPC_CC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:wi-val is deprecated.  Use rctestpkg-srv:wi instead.")
  (wi m))

(cl:ensure-generic-function 'i_max-val :lambda-list '(m))
(cl:defmethod i_max-val ((m <MPC_CC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:i_max-val is deprecated.  Use rctestpkg-srv:i_max instead.")
  (i_max m))

(cl:ensure-generic-function 'i_min-val :lambda-list '(m))
(cl:defmethod i_min-val ((m <MPC_CC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:i_min-val is deprecated.  Use rctestpkg-srv:i_min instead.")
  (i_min m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MPC_CC-request>) ostream)
  "Serializes a message object of type '<MPC_CC-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'u0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'i0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wv))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'i_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'i_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MPC_CC-request>) istream)
  "Deserializes a message object of type '<MPC_CC-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vr) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u0) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'i0) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wv) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wi) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'i_max) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'i_min) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MPC_CC-request>)))
  "Returns string type for a service object of type '<MPC_CC-request>"
  "rctestpkg/MPC_CCRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MPC_CC-request)))
  "Returns string type for a service object of type 'MPC_CC-request"
  "rctestpkg/MPC_CCRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MPC_CC-request>)))
  "Returns md5sum for a message object of type '<MPC_CC-request>"
  "7ee2ffc9de4aa168b06f3b4ade84ca37")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MPC_CC-request)))
  "Returns md5sum for a message object of type 'MPC_CC-request"
  "7ee2ffc9de4aa168b06f3b4ade84ca37")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MPC_CC-request>)))
  "Returns full string definition for message of type '<MPC_CC-request>"
  (cl:format cl:nil "float64 vr~%float64 u0~%float64 i0~%float64 wv~%float64 wi~%float64 i_max~%float64 i_min~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MPC_CC-request)))
  "Returns full string definition for message of type 'MPC_CC-request"
  (cl:format cl:nil "float64 vr~%float64 u0~%float64 i0~%float64 wv~%float64 wi~%float64 i_max~%float64 i_min~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MPC_CC-request>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MPC_CC-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MPC_CC-request
    (cl:cons ':vr (vr msg))
    (cl:cons ':u0 (u0 msg))
    (cl:cons ':i0 (i0 msg))
    (cl:cons ':wv (wv msg))
    (cl:cons ':wi (wi msg))
    (cl:cons ':i_max (i_max msg))
    (cl:cons ':i_min (i_min msg))
))
;//! \htmlinclude MPC_CC-response.msg.html

(cl:defclass <MPC_CC-response> (roslisp-msg-protocol:ros-message)
  ((i
    :reader i
    :initarg :i
    :type cl:float
    :initform 0.0))
)

(cl:defclass MPC_CC-response (<MPC_CC-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MPC_CC-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MPC_CC-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-srv:<MPC_CC-response> is deprecated: use rctestpkg-srv:MPC_CC-response instead.")))

(cl:ensure-generic-function 'i-val :lambda-list '(m))
(cl:defmethod i-val ((m <MPC_CC-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:i-val is deprecated.  Use rctestpkg-srv:i instead.")
  (i m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MPC_CC-response>) ostream)
  "Serializes a message object of type '<MPC_CC-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'i))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MPC_CC-response>) istream)
  "Deserializes a message object of type '<MPC_CC-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'i) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MPC_CC-response>)))
  "Returns string type for a service object of type '<MPC_CC-response>"
  "rctestpkg/MPC_CCResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MPC_CC-response)))
  "Returns string type for a service object of type 'MPC_CC-response"
  "rctestpkg/MPC_CCResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MPC_CC-response>)))
  "Returns md5sum for a message object of type '<MPC_CC-response>"
  "7ee2ffc9de4aa168b06f3b4ade84ca37")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MPC_CC-response)))
  "Returns md5sum for a message object of type 'MPC_CC-response"
  "7ee2ffc9de4aa168b06f3b4ade84ca37")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MPC_CC-response>)))
  "Returns full string definition for message of type '<MPC_CC-response>"
  (cl:format cl:nil "float64 i~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MPC_CC-response)))
  "Returns full string definition for message of type 'MPC_CC-response"
  (cl:format cl:nil "float64 i~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MPC_CC-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MPC_CC-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MPC_CC-response
    (cl:cons ':i (i msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MPC_CC)))
  'MPC_CC-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MPC_CC)))
  'MPC_CC-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MPC_CC)))
  "Returns string type for a service object of type '<MPC_CC>"
  "rctestpkg/MPC_CC")