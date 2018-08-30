;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::IMUdata)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'IMUdata (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::IMUDATA")
  (make-package "RCTESTPKG::IMUDATA"))

(in-package "ROS")
;;//! \htmlinclude IMUdata.msg.html


(defclass rctestpkg::IMUdata
  :super ros::object
  :slots (_time _ax _ay _az _gx _gy _gz _mx _my _mz ))

(defmethod rctestpkg::IMUdata
  (:init
   (&key
    ((:time __time) 0)
    ((:ax __ax) 0.0)
    ((:ay __ay) 0.0)
    ((:az __az) 0.0)
    ((:gx __gx) 0.0)
    ((:gy __gy) 0.0)
    ((:gz __gz) 0.0)
    ((:mx __mx) 0.0)
    ((:my __my) 0.0)
    ((:mz __mz) 0.0)
    )
   (send-super :init)
   (setq _time (round __time))
   (setq _ax (float __ax))
   (setq _ay (float __ay))
   (setq _az (float __az))
   (setq _gx (float __gx))
   (setq _gy (float __gy))
   (setq _gz (float __gz))
   (setq _mx (float __mx))
   (setq _my (float __my))
   (setq _mz (float __mz))
   self)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:ax
   (&optional __ax)
   (if __ax (setq _ax __ax)) _ax)
  (:ay
   (&optional __ay)
   (if __ay (setq _ay __ay)) _ay)
  (:az
   (&optional __az)
   (if __az (setq _az __az)) _az)
  (:gx
   (&optional __gx)
   (if __gx (setq _gx __gx)) _gx)
  (:gy
   (&optional __gy)
   (if __gy (setq _gy __gy)) _gy)
  (:gz
   (&optional __gz)
   (if __gz (setq _gz __gz)) _gz)
  (:mx
   (&optional __mx)
   (if __mx (setq _mx __mx)) _mx)
  (:my
   (&optional __my)
   (if __my (setq _my __my)) _my)
  (:mz
   (&optional __mz)
   (if __mz (setq _mz __mz)) _mz)
  (:serialization-length
   ()
   (+
    ;; uint64 _time
    8
    ;; float64 _ax
    8
    ;; float64 _ay
    8
    ;; float64 _az
    8
    ;; float64 _gx
    8
    ;; float64 _gy
    8
    ;; float64 _gz
    8
    ;; float64 _mx
    8
    ;; float64 _my
    8
    ;; float64 _mz
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint64 _time
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
     ;; float64 _ax
       (sys::poke _ax (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ay
       (sys::poke _ay (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _az
       (sys::poke _az (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _gx
       (sys::poke _gx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _gy
       (sys::poke _gy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _gz
       (sys::poke _gz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _mx
       (sys::poke _mx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _my
       (sys::poke _my (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _mz
       (sys::poke _mz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint64 _time
     
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
   ;; float64 _ax
     (setq _ax (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ay
     (setq _ay (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _az
     (setq _az (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _gx
     (setq _gx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _gy
     (setq _gy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _gz
     (setq _gz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _mx
     (setq _mx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _my
     (setq _my (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _mz
     (setq _mz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get rctestpkg::IMUdata :md5sum-) "8af935f52c34c17eaf99062f0e9ba26d")
(setf (get rctestpkg::IMUdata :datatype-) "rctestpkg/IMUdata")
(setf (get rctestpkg::IMUdata :definition-)
      "uint64 time
float64 ax
float64 ay
float64 az
float64 gx
float64 gy
float64 gz
float64 mx
float64 my
float64 mz

")



(provide :rctestpkg/IMUdata "8af935f52c34c17eaf99062f0e9ba26d")


