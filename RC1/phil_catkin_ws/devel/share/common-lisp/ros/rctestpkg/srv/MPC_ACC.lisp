; Auto-generated. Do not edit!


(cl:in-package rctestpkg-srv)


;//! \htmlinclude MPC_ACC-request.msg.html

(cl:defclass <MPC_ACC-request> (roslisp-msg-protocol:ros-message)
  ((u0
    :reader u0
    :initarg :u0
    :type cl:float
    :initform 0.0)
   (h0
    :reader h0
    :initarg :h0
    :type cl:float
    :initform 0.0)
   (vl
    :reader vl
    :initarg :vl
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
   (wh
    :reader wh
    :initarg :wh
    :type cl:float
    :initform 0.0)
   (wi
    :reader wi
    :initarg :wi
    :type cl:float
    :initform 0.0)
   (h_stop
    :reader h_stop
    :initarg :h_stop
    :type cl:float
    :initform 0.0)
   (T_gap
    :reader T_gap
    :initarg :T_gap
    :type cl:float
    :initform 0.0)
   (v_max
    :reader v_max
    :initarg :v_max
    :type cl:float
    :initform 0.0)
   (v_min
    :reader v_min
    :initarg :v_min
    :type cl:float
    :initform 0.0)
   (h_min
    :reader h_min
    :initarg :h_min
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

(cl:defclass MPC_ACC-request (<MPC_ACC-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MPC_ACC-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MPC_ACC-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-srv:<MPC_ACC-request> is deprecated: use rctestpkg-srv:MPC_ACC-request instead.")))

(cl:ensure-generic-function 'u0-val :lambda-list '(m))
(cl:defmethod u0-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:u0-val is deprecated.  Use rctestpkg-srv:u0 instead.")
  (u0 m))

(cl:ensure-generic-function 'h0-val :lambda-list '(m))
(cl:defmethod h0-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:h0-val is deprecated.  Use rctestpkg-srv:h0 instead.")
  (h0 m))

(cl:ensure-generic-function 'vl-val :lambda-list '(m))
(cl:defmethod vl-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:vl-val is deprecated.  Use rctestpkg-srv:vl instead.")
  (vl m))

(cl:ensure-generic-function 'i0-val :lambda-list '(m))
(cl:defmethod i0-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:i0-val is deprecated.  Use rctestpkg-srv:i0 instead.")
  (i0 m))

(cl:ensure-generic-function 'wv-val :lambda-list '(m))
(cl:defmethod wv-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:wv-val is deprecated.  Use rctestpkg-srv:wv instead.")
  (wv m))

(cl:ensure-generic-function 'wh-val :lambda-list '(m))
(cl:defmethod wh-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:wh-val is deprecated.  Use rctestpkg-srv:wh instead.")
  (wh m))

(cl:ensure-generic-function 'wi-val :lambda-list '(m))
(cl:defmethod wi-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:wi-val is deprecated.  Use rctestpkg-srv:wi instead.")
  (wi m))

(cl:ensure-generic-function 'h_stop-val :lambda-list '(m))
(cl:defmethod h_stop-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:h_stop-val is deprecated.  Use rctestpkg-srv:h_stop instead.")
  (h_stop m))

(cl:ensure-generic-function 'T_gap-val :lambda-list '(m))
(cl:defmethod T_gap-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:T_gap-val is deprecated.  Use rctestpkg-srv:T_gap instead.")
  (T_gap m))

(cl:ensure-generic-function 'v_max-val :lambda-list '(m))
(cl:defmethod v_max-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:v_max-val is deprecated.  Use rctestpkg-srv:v_max instead.")
  (v_max m))

(cl:ensure-generic-function 'v_min-val :lambda-list '(m))
(cl:defmethod v_min-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:v_min-val is deprecated.  Use rctestpkg-srv:v_min instead.")
  (v_min m))

(cl:ensure-generic-function 'h_min-val :lambda-list '(m))
(cl:defmethod h_min-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:h_min-val is deprecated.  Use rctestpkg-srv:h_min instead.")
  (h_min m))

(cl:ensure-generic-function 'i_max-val :lambda-list '(m))
(cl:defmethod i_max-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:i_max-val is deprecated.  Use rctestpkg-srv:i_max instead.")
  (i_max m))

(cl:ensure-generic-function 'i_min-val :lambda-list '(m))
(cl:defmethod i_min-val ((m <MPC_ACC-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:i_min-val is deprecated.  Use rctestpkg-srv:i_min instead.")
  (i_min m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MPC_ACC-request>) ostream)
  "Serializes a message object of type '<MPC_ACC-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'u0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'h0))))
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wh))))
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'h_stop))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'T_gap))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'v_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'v_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'h_min))))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MPC_ACC-request>) istream)
  "Deserializes a message object of type '<MPC_ACC-request>"
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
    (cl:setf (cl:slot-value msg 'h0) (roslisp-utils:decode-double-float-bits bits)))
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
    (cl:setf (cl:slot-value msg 'wh) (roslisp-utils:decode-double-float-bits bits)))
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
    (cl:setf (cl:slot-value msg 'h_stop) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'T_gap) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_max) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_min) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'h_min) (roslisp-utils:decode-double-float-bits bits)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MPC_ACC-request>)))
  "Returns string type for a service object of type '<MPC_ACC-request>"
  "rctestpkg/MPC_ACCRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MPC_ACC-request)))
  "Returns string type for a service object of type 'MPC_ACC-request"
  "rctestpkg/MPC_ACCRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MPC_ACC-request>)))
  "Returns md5sum for a message object of type '<MPC_ACC-request>"
  "cf39216e8627c9fbf3a389da0b0de171")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MPC_ACC-request)))
  "Returns md5sum for a message object of type 'MPC_ACC-request"
  "cf39216e8627c9fbf3a389da0b0de171")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MPC_ACC-request>)))
  "Returns full string definition for message of type '<MPC_ACC-request>"
  (cl:format cl:nil "float64 u0~%float64 h0~%float64 vl~%float64 i0~%float64 wv~%float64 wh~%float64 wi~%float64 h_stop~%float64 T_gap~%float64 v_max~%float64 v_min~%float64 h_min~%float64 i_max~%float64 i_min~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MPC_ACC-request)))
  "Returns full string definition for message of type 'MPC_ACC-request"
  (cl:format cl:nil "float64 u0~%float64 h0~%float64 vl~%float64 i0~%float64 wv~%float64 wh~%float64 wi~%float64 h_stop~%float64 T_gap~%float64 v_max~%float64 v_min~%float64 h_min~%float64 i_max~%float64 i_min~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MPC_ACC-request>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MPC_ACC-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MPC_ACC-request
    (cl:cons ':u0 (u0 msg))
    (cl:cons ':h0 (h0 msg))
    (cl:cons ':vl (vl msg))
    (cl:cons ':i0 (i0 msg))
    (cl:cons ':wv (wv msg))
    (cl:cons ':wh (wh msg))
    (cl:cons ':wi (wi msg))
    (cl:cons ':h_stop (h_stop msg))
    (cl:cons ':T_gap (T_gap msg))
    (cl:cons ':v_max (v_max msg))
    (cl:cons ':v_min (v_min msg))
    (cl:cons ':h_min (h_min msg))
    (cl:cons ':i_max (i_max msg))
    (cl:cons ':i_min (i_min msg))
))
;//! \htmlinclude MPC_ACC-response.msg.html

(cl:defclass <MPC_ACC-response> (roslisp-msg-protocol:ros-message)
  ((i
    :reader i
    :initarg :i
    :type cl:float
    :initform 0.0))
)

(cl:defclass MPC_ACC-response (<MPC_ACC-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MPC_ACC-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MPC_ACC-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-srv:<MPC_ACC-response> is deprecated: use rctestpkg-srv:MPC_ACC-response instead.")))

(cl:ensure-generic-function 'i-val :lambda-list '(m))
(cl:defmethod i-val ((m <MPC_ACC-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-srv:i-val is deprecated.  Use rctestpkg-srv:i instead.")
  (i m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MPC_ACC-response>) ostream)
  "Serializes a message object of type '<MPC_ACC-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MPC_ACC-response>) istream)
  "Deserializes a message object of type '<MPC_ACC-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MPC_ACC-response>)))
  "Returns string type for a service object of type '<MPC_ACC-response>"
  "rctestpkg/MPC_ACCResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MPC_ACC-response)))
  "Returns string type for a service object of type 'MPC_ACC-response"
  "rctestpkg/MPC_ACCResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MPC_ACC-response>)))
  "Returns md5sum for a message object of type '<MPC_ACC-response>"
  "cf39216e8627c9fbf3a389da0b0de171")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MPC_ACC-response)))
  "Returns md5sum for a message object of type 'MPC_ACC-response"
  "cf39216e8627c9fbf3a389da0b0de171")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MPC_ACC-response>)))
  "Returns full string definition for message of type '<MPC_ACC-response>"
  (cl:format cl:nil "float64 i~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MPC_ACC-response)))
  "Returns full string definition for message of type 'MPC_ACC-response"
  (cl:format cl:nil "float64 i~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MPC_ACC-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MPC_ACC-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MPC_ACC-response
    (cl:cons ':i (i msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MPC_ACC)))
  'MPC_ACC-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MPC_ACC)))
  'MPC_ACC-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MPC_ACC)))
  "Returns string type for a service object of type '<MPC_ACC>"
  "rctestpkg/MPC_ACC")