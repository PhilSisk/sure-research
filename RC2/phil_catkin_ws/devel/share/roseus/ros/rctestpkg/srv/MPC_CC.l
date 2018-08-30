;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::MPC_CC)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'MPC_CC (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::MPC_CC")
  (make-package "RCTESTPKG::MPC_CC"))
(unless (find-package "RCTESTPKG::MPC_CCREQUEST")
  (make-package "RCTESTPKG::MPC_CCREQUEST"))
(unless (find-package "RCTESTPKG::MPC_CCRESPONSE")
  (make-package "RCTESTPKG::MPC_CCRESPONSE"))

(in-package "ROS")





(defclass rctestpkg::MPC_CCRequest
  :super ros::object
  :slots (_vr _u0 _i0 _wv _wi _i_max _i_min ))

(defmethod rctestpkg::MPC_CCRequest
  (:init
   (&key
    ((:vr __vr) 0.0)
    ((:u0 __u0) 0.0)
    ((:i0 __i0) 0.0)
    ((:wv __wv) 0.0)
    ((:wi __wi) 0.0)
    ((:i_max __i_max) 0.0)
    ((:i_min __i_min) 0.0)
    )
   (send-super :init)
   (setq _vr (float __vr))
   (setq _u0 (float __u0))
   (setq _i0 (float __i0))
   (setq _wv (float __wv))
   (setq _wi (float __wi))
   (setq _i_max (float __i_max))
   (setq _i_min (float __i_min))
   self)
  (:vr
   (&optional __vr)
   (if __vr (setq _vr __vr)) _vr)
  (:u0
   (&optional __u0)
   (if __u0 (setq _u0 __u0)) _u0)
  (:i0
   (&optional __i0)
   (if __i0 (setq _i0 __i0)) _i0)
  (:wv
   (&optional __wv)
   (if __wv (setq _wv __wv)) _wv)
  (:wi
   (&optional __wi)
   (if __wi (setq _wi __wi)) _wi)
  (:i_max
   (&optional __i_max)
   (if __i_max (setq _i_max __i_max)) _i_max)
  (:i_min
   (&optional __i_min)
   (if __i_min (setq _i_min __i_min)) _i_min)
  (:serialization-length
   ()
   (+
    ;; float64 _vr
    8
    ;; float64 _u0
    8
    ;; float64 _i0
    8
    ;; float64 _wv
    8
    ;; float64 _wi
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
     ;; float64 _vr
       (sys::poke _vr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _u0
       (sys::poke _u0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i0
       (sys::poke _i0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wv
       (sys::poke _wv (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wi
       (sys::poke _wi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i_max
       (sys::poke _i_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i_min
       (sys::poke _i_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _vr
     (setq _vr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _u0
     (setq _u0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i0
     (setq _i0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wv
     (setq _wv (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wi
     (setq _wi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i_max
     (setq _i_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i_min
     (setq _i_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass rctestpkg::MPC_CCResponse
  :super ros::object
  :slots (_i ))

(defmethod rctestpkg::MPC_CCResponse
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

(defclass rctestpkg::MPC_CC
  :super ros::object
  :slots ())

(setf (get rctestpkg::MPC_CC :md5sum-) "7ee2ffc9de4aa168b06f3b4ade84ca37")
(setf (get rctestpkg::MPC_CC :datatype-) "rctestpkg/MPC_CC")
(setf (get rctestpkg::MPC_CC :request) rctestpkg::MPC_CCRequest)
(setf (get rctestpkg::MPC_CC :response) rctestpkg::MPC_CCResponse)

(defmethod rctestpkg::MPC_CCRequest
  (:response () (instance rctestpkg::MPC_CCResponse :init)))

(setf (get rctestpkg::MPC_CCRequest :md5sum-) "7ee2ffc9de4aa168b06f3b4ade84ca37")
(setf (get rctestpkg::MPC_CCRequest :datatype-) "rctestpkg/MPC_CCRequest")
(setf (get rctestpkg::MPC_CCRequest :definition-)
      "float64 vr
float64 u0
float64 i0
float64 wv
float64 wi
float64 i_max
float64 i_min
---
float64 i

")

(setf (get rctestpkg::MPC_CCResponse :md5sum-) "7ee2ffc9de4aa168b06f3b4ade84ca37")
(setf (get rctestpkg::MPC_CCResponse :datatype-) "rctestpkg/MPC_CCResponse")
(setf (get rctestpkg::MPC_CCResponse :definition-)
      "float64 vr
float64 u0
float64 i0
float64 wv
float64 wi
float64 i_max
float64 i_min
---
float64 i

")



(provide :rctestpkg/MPC_CC "7ee2ffc9de4aa168b06f3b4ade84ca37")


