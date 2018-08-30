;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::currentTime)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'currentTime (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::CURRENTTIME")
  (make-package "RCTESTPKG::CURRENTTIME"))

(in-package "ROS")
;;//! \htmlinclude currentTime.msg.html


(defclass rctestpkg::currentTime
  :super ros::object
  :slots (_time ))

(defmethod rctestpkg::currentTime
  (:init
   (&key
    ((:time __time) 0)
    )
   (send-super :init)
   (setq _time (round __time))
   self)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:serialization-length
   ()
   (+
    ;; int64 _time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _time
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _time (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _time) (= (length (_time . bv)) 2)) ;; bignum
              (write-long (ash (elt (_time . bv) 0) 0) s)
              (write-long (ash (elt (_time . bv) 1) -1) s))
             ((and (class _time) (= (length (_time . bv)) 1)) ;; big1
              (write-long (elt (_time . bv) 0) s)
              (write-long (if (>= _time 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _time s)(write-long (if (>= _time 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _time
#+(or :alpha :irix6 :x86_64)
      (setf _time (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _time (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get rctestpkg::currentTime :md5sum-) "50be640c11c45b7adcb0b6b7fbf3f928")
(setf (get rctestpkg::currentTime :datatype-) "rctestpkg/currentTime")
(setf (get rctestpkg::currentTime :definition-)
      "int64 time

")



(provide :rctestpkg/currentTime "50be640c11c45b7adcb0b6b7fbf3f928")


