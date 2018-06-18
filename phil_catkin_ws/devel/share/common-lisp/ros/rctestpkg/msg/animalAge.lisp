; Auto-generated. Do not edit!


(cl:in-package rctestpkg-msg)


;//! \htmlinclude animalAge.msg.html

(cl:defclass <animalAge> (roslisp-msg-protocol:ros-message)
  ((species
    :reader species
    :initarg :species
    :type cl:string
    :initform "")
   (age
    :reader age
    :initarg :age
    :type cl:integer
    :initform 0))
)

(cl:defclass animalAge (<animalAge>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <animalAge>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'animalAge)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rctestpkg-msg:<animalAge> is deprecated: use rctestpkg-msg:animalAge instead.")))

(cl:ensure-generic-function 'species-val :lambda-list '(m))
(cl:defmethod species-val ((m <animalAge>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:species-val is deprecated.  Use rctestpkg-msg:species instead.")
  (species m))

(cl:ensure-generic-function 'age-val :lambda-list '(m))
(cl:defmethod age-val ((m <animalAge>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rctestpkg-msg:age-val is deprecated.  Use rctestpkg-msg:age instead.")
  (age m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <animalAge>) ostream)
  "Serializes a message object of type '<animalAge>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'species))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'species))
  (cl:let* ((signed (cl:slot-value msg 'age)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <animalAge>) istream)
  "Deserializes a message object of type '<animalAge>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'species) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'species) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'age) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<animalAge>)))
  "Returns string type for a message object of type '<animalAge>"
  "rctestpkg/animalAge")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'animalAge)))
  "Returns string type for a message object of type 'animalAge"
  "rctestpkg/animalAge")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<animalAge>)))
  "Returns md5sum for a message object of type '<animalAge>"
  "18f4dd8d566c5f3748f449c6cf5dda79")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'animalAge)))
  "Returns md5sum for a message object of type 'animalAge"
  "18f4dd8d566c5f3748f449c6cf5dda79")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<animalAge>)))
  "Returns full string definition for message of type '<animalAge>"
  (cl:format cl:nil "string species~%int64 age~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'animalAge)))
  "Returns full string definition for message of type 'animalAge"
  (cl:format cl:nil "string species~%int64 age~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <animalAge>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'species))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <animalAge>))
  "Converts a ROS message object to a list"
  (cl:list 'animalAge
    (cl:cons ':species (species msg))
    (cl:cons ':age (age msg))
))
