;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::MPC_ACC)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'MPC_ACC (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::MPC_ACC")
  (make-package "RCTESTPKG::MPC_ACC"))
(unless (find-package "RCTESTPKG::MPC_ACCREQUEST")
  (make-package "RCTESTPKG::MPC_ACCREQUEST"))
(unless (find-package "RCTESTPKG::MPC_ACCRESPONSE")
  (make-package "RCTESTPKG::MPC_ACCRESPONSE"))

(in-package "ROS")





(defclass rctestpkg::MPC_ACCRequest
  :super ros::object
  :slots (_u0 _h0 _vl _i0 _wv _wh _wi _h_stop _T_gap _v_max _v_min _h_min _i_max _i_min ))

(defmethod rctestpkg::MPC_ACCRequest
  (:init
   (&key
    ((:u0 __u0) 0.0)
    ((:h0 __h0) 0.0)
    ((:vl __vl) 0.0)
    ((:i0 __i0) 0.0)
    ((:wv __wv) 0.0)
    ((:wh __wh) 0.0)
    ((:wi __wi) 0.0)
    ((:h_stop __h_stop) 0.0)
    ((:T_gap __T_gap) 0.0)
    ((:v_max __v_max) 0.0)
    ((:v_min __v_min) 0.0)
    ((:h_min __h_min) 0.0)
    ((:i_max __i_max) 0.0)
    ((:i_min __i_min) 0.0)
    )
   (send-super :init)
   (setq _u0 (float __u0))
   (setq _h0 (float __h0))
   (setq _vl (float __vl))
   (setq _i0 (float __i0))
   (setq _wv (float __wv))
   (setq _wh (float __wh))
   (setq _wi (float __wi))
   (setq _h_stop (float __h_stop))
   (setq _T_gap (float __T_gap))
   (setq _v_max (float __v_max))
   (setq _v_min (float __v_min))
   (setq _h_min (float __h_min))
   (setq _i_max (float __i_max))
   (setq _i_min (float __i_min))
   self)
  (:u0
   (&optional __u0)
   (if __u0 (setq _u0 __u0)) _u0)
  (:h0
   (&optional __h0)
   (if __h0 (setq _h0 __h0)) _h0)
  (:vl
   (&optional __vl)
   (if __vl (setq _vl __vl)) _vl)
  (:i0
   (&optional __i0)
   (if __i0 (setq _i0 __i0)) _i0)
  (:wv
   (&optional __wv)
   (if __wv (setq _wv __wv)) _wv)
  (:wh
   (&optional __wh)
   (if __wh (setq _wh __wh)) _wh)
  (:wi
   (&optional __wi)
   (if __wi (setq _wi __wi)) _wi)
  (:h_stop
   (&optional __h_stop)
   (if __h_stop (setq _h_stop __h_stop)) _h_stop)
  (:T_gap
   (&optional __T_gap)
   (if __T_gap (setq _T_gap __T_gap)) _T_gap)
  (:v_max
   (&optional __v_max)
   (if __v_max (setq _v_max __v_max)) _v_max)
  (:v_min
   (&optional __v_min)
   (if __v_min (setq _v_min __v_min)) _v_min)
  (:h_min
   (&optional __h_min)
   (if __h_min (setq _h_min __h_min)) _h_min)
  (:i_max
   (&optional __i_max)
   (if __i_max (setq _i_max __i_max)) _i_max)
  (:i_min
   (&optional __i_min)
   (if __i_min (setq _i_min __i_min)) _i_min)
  (:serialization-length
   ()
   (+
    ;; float64 _u0
    8
    ;; float64 _h0
    8
    ;; float64 _vl
    8
    ;; float64 _i0
    8
    ;; float64 _wv
    8
    ;; float64 _wh
    8
    ;; float64 _wi
    8
    ;; float64 _h_stop
    8
    ;; float64 _T_gap
    8
    ;; float64 _v_max
    8
    ;; float64 _v_min
    8
    ;; float64 _h_min
    8
    ;; float64 _i_max
    8
    ;; float64 _i_min
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _u0
       (sys::poke _u0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _h0
       (sys::poke _h0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vl
       (sys::poke _vl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i0
       (sys::poke _i0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wv
       (sys::poke _wv (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wh
       (sys::poke _wh (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wi
       (sys::poke _wi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _h_stop
       (sys::poke _h_stop (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _T_gap
       (sys::poke _T_gap (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v_max
       (sys::poke _v_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v_min
       (sys::poke _v_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _h_min
       (sys::poke _h_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i_max
       (sys::poke _i_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i_min
       (sys::poke _i_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _u0
     (setq _u0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _h0
     (setq _h0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vl
     (setq _vl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i0
     (setq _i0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wv
     (setq _wv (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wh
     (setq _wh (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wi
     (setq _wi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _h_stop
     (setq _h_stop (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _T_gap
     (setq _T_gap (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v_max
     (setq _v_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v_min
     (setq _v_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _h_min
     (setq _h_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i_max
     (setq _i_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i_min
     (setq _i_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass rctestpkg::MPC_ACCResponse
  :super ros::object
  :slots (_i ))

(defmethod rctestpkg::MPC_ACCResponse
  (:init
   (&key
    ((:i __i) 0.0)
    )
   (send-super :init)
   (setq _i (float __i))
   self)
  (:i
   (&optional __i)
   (if __i (setq _i __i)) _i)
  (:serialization-length
   ()
   (+
    ;; float64 _i
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _i
       (sys::poke _i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _i
     (setq _i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass rctestpkg::MPC_ACC
  :super ros::object
  :slots ())

(setf (get rctestpkg::MPC_ACC :md5sum-) "cf39216e8627c9fbf3a389da0b0de171")
(setf (get rctestpkg::MPC_ACC :datatype-) "rctestpkg/MPC_ACC")
(setf (get rctestpkg::MPC_ACC :request) rctestpkg::MPC_ACCRequest)
(setf (get rctestpkg::MPC_ACC :response) rctestpkg::MPC_ACCResponse)

(defmethod rctestpkg::MPC_ACCRequest
  (:response () (instance rctestpkg::MPC_ACCResponse :init)))

(setf (get rctestpkg::MPC_ACCRequest :md5sum-) "cf39216e8627c9fbf3a389da0b0de171")
(setf (get rctestpkg::MPC_ACCRequest :datatype-) "rctestpkg/MPC_ACCRequest")
(setf (get rctestpkg::MPC_ACCRequest :definition-)
      "float64 u0
float64 h0
float64 vl
float64 i0
float64 wv
float64 wh
float64 wi
float64 h_stop
float64 T_gap
float64 v_max
float64 v_min
float64 h_min
float64 i_max
float64 i_min
---
float64 i

")

(setf (get rctestpkg::MPC_ACCResponse :md5sum-) "cf39216e8627c9fbf3a389da0b0de171")
(setf (get rctestpkg::MPC_ACCResponse :datatype-) "rctestpkg/MPC_ACCResponse")
(setf (get rctestpkg::MPC_ACCResponse :definition-)
      "float64 u0
float64 h0
float64 vl
float64 i0
float64 wv
float64 wh
float64 wi
float64 h_stop
float64 T_gap
float64 v_max
float64 v_min
float64 h_min
float64 i_max
float64 i_min
---
float64 i

")



(provide :rctestpkg/MPC_ACC "cf39216e8627c9fbf3a389da0b0de171")


