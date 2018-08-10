;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::LKdata)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'LKdata (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::LKDATA")
  (make-package "RCTESTPKG::LKDATA"))

(in-package "ROS")
;;//! \htmlinclude LKdata.msg.html


(defclass rctestpkg::LKdata
  :super ros::object
  :slots (_y _vl _phi _r _rd ))

(defmethod rctestpkg::LKdata
  (:init
   (&key
    ((:y __y) 0.0)
    ((:vl __vl) 0.0)
    ((:phi __phi) 0.0)
    ((:r __r) 0.0)
    ((:rd __rd) 0.0)
    )
   (send-super :init)
   (setq _y (float __y))
   (setq _vl (float __vl))
   (setq _phi (float __phi))
   (setq _r (float __r))
   (setq _rd (float __rd))
   self)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:vl
   (&optional __vl)
   (if __vl (setq _vl __vl)) _vl)
  (:phi
   (&optional __phi)
   (if __phi (setq _phi __phi)) _phi)
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:rd
   (&optional __rd)
   (if __rd (setq _rd __rd)) _rd)
  (:serialization-length
   ()
   (+
    ;; float64 _y
    8
    ;; float64 _vl
    8
    ;; float64 _phi
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
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vl
       (sys::poke _vl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _phi
       (sys::poke _phi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _r
       (sys::poke _r (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rd
       (sys::poke _rd (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vl
     (setq _vl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _phi
     (setq _phi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _r
     (setq _r (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rd
     (setq _rd (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get rctestpkg::LKdata :md5sum-) "7e0ad131c0d1bef35b3e8e9fd510b179")
(setf (get rctestpkg::LKdata :datatype-) "rctestpkg/LKdata")
(setf (get rctestpkg::LKdata :definition-)
      "# LK data: includes y-position, lateral velocity, yaw angle, yaw rate, and road curvature
float64 y
float64 vl
float64 phi
float64 r
float64 rd

")



(provide :rctestpkg/LKdata "7e0ad131c0d1bef35b3e8e9fd510b179")


