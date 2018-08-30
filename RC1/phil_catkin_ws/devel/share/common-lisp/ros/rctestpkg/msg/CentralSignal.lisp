; Auto-generated. Do not edit!


(cl:in-package rctestpkg-msg)


;//! \htmlinclude CentralSignal.msg.html

(cl:defclass <CentralSignal> (roslisp-msg-protocol:ros-message)
  ((lanekeeping
    :reader lanekeeping
    :initarg :lanekeeping
    :type cl:boolean
    :initform cl:nil)
   (right_lane
    :reader right_lane
    :initarg :right_lane
    :type cl:boolean
    :initform cl:nil)
   (cruise_control
    :reader cruise_control
    :initarg :cruise_control
    :type cl:boolean
    :initform cl:nil)
   (stop
    :reader stop
    :initarg :stop
    :type cl:boolean
    :initform cl:nil)
   (command_v
    :reader command_v
    :initarg :command_v
    :type cl:float
    :initform 0.0)
   (servo_pwm
    :reader servo_pwm
    :initarg :servo_pwm
    :type cl:fixnum
    :initform 0))
)

(cl:defclass CentralSignal (<CentralSignal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CentralSignal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CentralSignal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-msg:<CentralSignal> is deprecated: use rctestpkg-msg:CentralSignal instead.")))

(cl:ensure-generic-function 'lanekeeping-val :lambda-list '(m))
(cl:defmethod lanekeeping-val ((m <CentralSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:lanekeeping-val is deprecated.  Use rctestpkg-msg:lanekeeping instead.")
  (lanekeeping m))

(cl:ensure-generic-function 'right_lane-val :lambda-list '(m))
(cl:defmethod right_lane-val ((m <CentralSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:right_lane-val is deprecated.  Use rctestpkg-msg:right_lane instead.")
  (right_lane m))

(cl:ensure-generic-function 'cruise_control-val :lambda-list '(m))
(cl:defmethod cruise_control-val ((m <CentralSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:cruise_control-val is deprecated.  Use rctestpkg-msg:cruise_control instead.")
  (cruise_control m))

(cl:ensure-generic-function 'stop-val :lambda-list '(m))
(cl:defmethod stop-val ((m <CentralSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:stop-val is deprecated.  Use rctestpkg-msg:stop instead.")
  (stop m))

(cl:ensure-generic-function 'command_v-val :lambda-list '(m))
(cl:defmethod command_v-val ((m <CentralSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:command_v-val is deprecated.  Use rctestpkg-msg:command_v instead.")
  (command_v m))

(cl:ensure-generic-function 'servo_pwm-val :lambda-list '(m))
(cl:defmethod servo_pwm-val ((m <CentralSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:servo_pwm-val is deprecated.  Use rctestpkg-msg:servo_pwm instead.")
  (servo_pwm m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CentralSignal>) ostream)
  "Serializes a message object of type '<CentralSignal>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'lanekeeping) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'right_lane) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cruise_control) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'stop) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'command_v))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'servo_pwm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'servo_pwm)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CentralSignal>) istream)
  "Deserializes a message object of type '<CentralSignal>"
    (cl:setf (cl:slot-value msg 'lanekeeping) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'right_lane) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'cruise_control) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'stop) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'command_v) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'servo_pwm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'servo_pwm)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CentralSignal>)))
  "Returns string type for a message object of type '<CentralSignal>"
  "rctestpkg/CentralSignal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CentralSignal)))
  "Returns string type for a message object of type 'CentralSignal"
  "rctestpkg/CentralSignal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CentralSignal>)))
  "Returns md5sum for a message object of type '<CentralSignal>"
  "7d4286309f6e1dd55dc49e54e2e770cf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CentralSignal)))
  "Returns md5sum for a message object of type 'CentralSignal"
  "7d4286309f6e1dd55dc49e54e2e770cf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CentralSignal>)))
  "Returns full string definition for message of type '<CentralSignal>"
  (cl:format cl:nil "bool lanekeeping~%bool right_lane~%bool cruise_control~%bool stop~%float64 command_v~%uint16 servo_pwm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CentralSignal)))
  "Returns full string definition for message of type 'CentralSignal"
  (cl:format cl:nil "bool lanekeeping~%bool right_lane~%bool cruise_control~%bool stop~%float64 command_v~%uint16 servo_pwm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CentralSignal>))
  (cl:+ 0
     1
     1
     1
     1
     8
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CentralSignal>))
  "Converts a ROS message object to a list"
  (cl:list 'CentralSignal
    (cl:cons ':lanekeeping (lanekeeping msg))
    (cl:cons ':right_lane (right_lane msg))
    (cl:cons ':cruise_control (cruise_control msg))
    (cl:cons ':stop (stop msg))
    (cl:cons ':command_v (command_v msg))
    (cl:cons ':servo_pwm (servo_pwm msg))
))
