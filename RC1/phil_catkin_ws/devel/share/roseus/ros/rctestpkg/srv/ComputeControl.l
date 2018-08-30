;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::ComputeControl)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'ComputeControl (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::COMPUTECONTROL")
  (make-package "RCTESTPKG::COMPUTECONTROL"))
(unless (find-package "RCTESTPKG::COMPUTECONTROLREQUEST")
  (make-package "RCTESTPKG::COMPUTECONTROLREQUEST"))
(unless (find-package "RCTESTPKG::COMPUTECONTROLRESPONSE")
  (make-package "RCTESTPKG::COMPUTECONTROLRESPONSE"))

(in-package "ROS")





(defclass rctestpkg::ComputeControlRequest
  :super ros::object
  :slots (_v _h _vl ))

(defmethod rctestpkg::ComputeControlRequest
  (:init
   (&key
    ((:v __v) 0.0)
    ((:h __h) 0.0)
    ((:vl __vl) 0.0)
    )
   (send-super :init)
   (setq _v (float __v))
   (setq _h (float __h))
   (setq _vl (float __vl))
   self)
  (:v
   (&optional __v)
   (if __v (setq _v __v)) _v)
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:vl
   (&optional __vl)
   (if __vl (setq _vl __vl)) _vl)
  (:serialization-length
   ()
   (+
    ;; float64 _v
    8
    ;; float64 _h
    8
    ;; float64 _vl
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _v
       (sys::poke _v (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _h
       (sys::poke _h (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vl
       (sys::poke _vl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _v
     (setq _v (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _h
     (setq _h (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vl
     (setq _vl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass rctestpkg::ComputeControlResponse
  :super ros::object
  :slots (_u ))

(defmethod rctestpkg::ComputeControlResponse
  (:init
   (&key
    ((:u __u) 0.0)
    )
   (send-super :init)
   (setq _u (float __u))
   self)
  (:u
   (&optional __u)
   (if __u (setq _u __u)) _u)
  (:serialization-length
   ()
   (+
    ;; float64 _u
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _u
       (sys::poke _u (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _u
     (setq _u (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass rctestpkg::ComputeControl
  :super ros::object
  :slots ())

(setf (get rctestpkg::ComputeControl :md5sum-) "99cbc1e3badf94dc8e3459eb691661ab")
(setf (get rctestpkg::ComputeControl :datatype-) "rctestpkg/ComputeControl")
(setf (get rctestpkg::ComputeControl :request) rctestpkg::ComputeControlRequest)
(setf (get rctestpkg::ComputeControl :response) rctestpkg::ComputeControlResponse)

(defmethod rctestpkg::ComputeControlRequest
  (:response () (instance rctestpkg::ComputeControlResponse :init)))

(setf (get rctestpkg::ComputeControlRequest :md5sum-) "99cbc1e3badf94dc8e3459eb691661ab")
(setf (get rctestpkg::ComputeControlRequest :datatype-) "rctestpkg/ComputeControlRequest")
(setf (get rctestpkg::ComputeControlRequest :definition-)
      "float64 v
float64 h
float64 vl
---
float64 u

")

(setf (get rctestpkg::ComputeControlResponse :md5sum-) "99cbc1e3badf94dc8e3459eb691661ab")
(setf (get rctestpkg::ComputeControlResponse :datatype-) "rctestpkg/ComputeControlResponse")
(setf (get rctestpkg::ComputeControlResponse :definition-)
      "float64 v
float64 h
float64 vl
---
float64 u

")



(provide :rctestpkg/ComputeControl "99cbc1e3badf94dc8e3459eb691661ab")


