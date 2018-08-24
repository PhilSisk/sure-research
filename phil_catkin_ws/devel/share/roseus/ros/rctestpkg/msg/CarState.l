;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::CarState)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'CarState (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::CARSTATE")
  (make-package "RCTESTPKG::CARSTATE"))

(in-package "ROS")
;;//! \htmlinclude CarState.msg.html


(defclass rctestpkg::CarState
  :super ros::object
  :slots (_time _x_global _y_global _yaw_global _h _h_angle _vl _u _y _v _psi _r _rd ))

(defmethod rctestpkg::CarState
  (:init
   (&key
    ((:time __time) 0.0)
    ((:x_global __x_global) 0.0)
    ((:y_global __y_global) 0.0)
    ((:yaw_global __yaw_global) 0.0)
    ((:h __h) 0.0)
    ((:h_angle __h_angle) 0.0)
    ((:vl __vl) 0.0)
    ((:u __u) 0.0)
    ((:y __y) 0.0)
    ((:v __v) 0.0)
    ((:psi __psi) 0.0)
    ((:r __r) 0.0)
    ((:rd __rd) 0.0)
    )
   (send-super :init)
   (setq _time (float __time))
   (setq _x_global (float __x_global))
   (setq _y_global (float __y_global))
   (setq _yaw_global (float __yaw_global))
   (setq _h (float __h))
   (setq _h_angle (float __h_angle))
   (setq _vl (float __vl))
   (setq _u (float __u))
   (setq _y (float __y))
   (setq _v (float __v))
   (setq _psi (float __psi))
   (setq _r (float __r))
   (setq _rd (float __rd))
   self)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:x_global
   (&optional __x_global)
   (if __x_global (setq _x_global __x_global)) _x_global)
  (:y_global
   (&optional __y_global)
   (if __y_global (setq _y_global __y_global)) _y_global)
  (:yaw_global
   (&optional __yaw_global)
   (if __yaw_global (setq _yaw_global __yaw_global)) _yaw_global)
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:h_angle
   (&optional __h_angle)
   (if __h_angle (setq _h_angle __h_angle)) _h_angle)
  (:vl
   (&optional __vl)
   (if __vl (setq _vl __vl)) _vl)
  (:u
   (&optional __u)
   (if __u (setq _u __u)) _u)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:v
   (&optional __v)
   (if __v (setq _v __v)) _v)
  (:psi
   (&optional __psi)
   (if __psi (setq _psi __psi)) _psi)
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:rd
   (&optional __rd)
   (if __rd (setq _rd __rd)) _rd)
  (:serialization-length
   ()
   (+
    ;; float64 _time
    8
    ;; float64 _x_global
    8
    ;; float64 _y_global
    8
    ;; float64 _yaw_global
    8
    ;; float64 _h
    8
    ;; float64 _h_angle
    8
    ;; float64 _vl
    8
    ;; float64 _u
    8
    ;; float64 _y
    8
    ;; float64 _v
    8
    ;; float64 _psi
    8
    ;; float64 _r
    8
    ;; float64 _rd
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x_global
       (sys::poke _x_global (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_global
       (sys::poke _y_global (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw_global
       (sys::poke _yaw_global (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _h
       (sys::poke _h (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _h_angle
       (sys::poke _h_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vl
       (sys::poke _vl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _u
       (sys::poke _u (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v
       (sys::poke _v (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _psi
       (sys::poke _psi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _r
       (sys::poke _r (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rd
       (sys::poke _rd (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x_global
     (setq _x_global (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_global
     (setq _y_global (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw_global
     (setq _yaw_global (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _h
     (setq _h (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _h_angle
     (setq _h_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vl
     (setq _vl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _u
     (setq _u (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v
     (setq _v (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _psi
     (setq _psi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _r
     (setq _r (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rd
     (setq _rd (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get rctestpkg::CarState :md5sum-) "546fdc741d393a86a6853d0d0c25fc49")
(setf (get rctestpkg::CarState :datatype-) "rctestpkg/CarState")
(setf (get rctestpkg::CarState :definition-)
      "float64 time
float64 x_global
float64 y_global
float64 yaw_global
float64 h
float64 h_angle
float64 vl
float64 u
float64 y
float64 v
float64 psi
float64 r
float64 rd

")



(provide :rctestpkg/CarState "546fdc741d393a86a6853d0d0c25fc49")


