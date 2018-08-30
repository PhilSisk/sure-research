;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::Motor_data)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'Motor_data (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::MOTOR_DATA")
  (make-package "RCTESTPKG::MOTOR_DATA"))

(in-package "ROS")
;;//! \htmlinclude Motor_data.msg.html


(defclass rctestpkg::Motor_data
  :super ros::object
  :slots (_position _countPerSecond _current _h _hdot ))

(defmethod rctestpkg::Motor_data
  (:init
   (&key
    ((:position __position) 0)
    ((:countPerSecond __countPerSecond) 0)
    ((:current __current) 0.0)
    ((:h __h) 0.0)
    ((:hdot __hdot) 0.0)
    )
   (send-super :init)
   (setq _position (round __position))
   (setq _countPerSecond (round __countPerSecond))
   (setq _current (float __current))
   (setq _h (float __h))
   (setq _hdot (float __hdot))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:countPerSecond
   (&optional __countPerSecond)
   (if __countPerSecond (setq _countPerSecond __countPerSecond)) _countPerSecond)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:hdot
   (&optional __hdot)
   (if __hdot (setq _hdot __hdot)) _hdot)
  (:serialization-length
   ()
   (+
    ;; int64 _position
    8
    ;; int64 _countPerSecond
    8
    ;; float64 _current
    8
    ;; float64 _h
    8
    ;; float64 _hdot
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _position
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _position (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _position) (= (length (_position . bv)) 2)) ;; bignum
              (write-long (ash (elt (_position . bv) 0) 0) s)
              (write-long (ash (elt (_position . bv) 1) -1) s))
             ((and (class _position) (= (length (_position . bv)) 1)) ;; big1
              (write-long (elt (_position . bv) 0) s)
              (write-long (if (>= _position 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _position s)(write-long (if (>= _position 0) 0 #xffffffff) s)))
     ;; int64 _countPerSecond
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _countPerSecond (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _countPerSecond) (= (length (_countPerSecond . bv)) 2)) ;; bignum
              (write-long (ash (elt (_countPerSecond . bv) 0) 0) s)
              (write-long (ash (elt (_countPerSecond . bv) 1) -1) s))
             ((and (class _countPerSecond) (= (length (_countPerSecond . bv)) 1)) ;; big1
              (write-long (elt (_countPerSecond . bv) 0) s)
              (write-long (if (>= _countPerSecond 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _countPerSecond s)(write-long (if (>= _countPerSecond 0) 0 #xffffffff) s)))
     ;; float64 _current
       (sys::poke _current (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _h
       (sys::poke _h (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _hdot
       (sys::poke _hdot (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _position
#+(or :alpha :irix6 :x86_64)
      (setf _position (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _position (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _countPerSecond
#+(or :alpha :irix6 :x86_64)
      (setf _countPerSecond (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _countPerSecond (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _current
     (setq _current (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _h
     (setq _h (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _hdot
     (setq _hdot (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get rctestpkg::Motor_data :md5sum-) "52f2e122b08e43f7a7e3b1d033bdba18")
(setf (get rctestpkg::Motor_data :datatype-) "rctestpkg/Motor_data")
(setf (get rctestpkg::Motor_data :definition-)
      "int64 position
int64 countPerSecond
float64 current
float64 h
float64 hdot

")



(provide :rctestpkg/Motor_data "52f2e122b08e43f7a7e3b1d033bdba18")


