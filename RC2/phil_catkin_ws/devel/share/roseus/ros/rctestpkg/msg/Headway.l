;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::Headway)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'Headway (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::HEADWAY")
  (make-package "RCTESTPKG::HEADWAY"))

(in-package "ROS")
;;//! \htmlinclude Headway.msg.html


(defclass rctestpkg::Headway
  :super ros::object
  :slots (_h _angle _h_radial ))

(defmethod rctestpkg::Headway
  (:init
   (&key
    ((:h __h) 0.0)
    ((:angle __angle) 0.0)
    ((:h_radial __h_radial) 0.0)
    )
   (send-super :init)
   (setq _h (float __h))
   (setq _angle (float __angle))
   (setq _h_radial (float __h_radial))
   self)
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:h_radial
   (&optional __h_radial)
   (if __h_radial (setq _h_radial __h_radial)) _h_radial)
  (:serialization-length
   ()
   (+
    ;; float64 _h
    8
    ;; float64 _angle
    8
    ;; float64 _h_radial
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _h
       (sys::poke _h (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _h_radial
       (sys::poke _h_radial (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _h
     (setq _h (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _h_radial
     (setq _h_radial (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get rctestpkg::Headway :md5sum-) "9d6005cd199dedcc940134177d7d87ef")
(setf (get rctestpkg::Headway :datatype-) "rctestpkg/Headway")
(setf (get rctestpkg::Headway :definition-)
      "float64 h
float64 angle
float64 h_radial

")



(provide :rctestpkg/Headway "9d6005cd199dedcc940134177d7d87ef")


