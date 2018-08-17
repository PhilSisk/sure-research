;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::MPC_LK)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'MPC_LK (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::MPC_LK")
  (make-package "RCTESTPKG::MPC_LK"))
(unless (find-package "RCTESTPKG::MPC_LKREQUEST")
  (make-package "RCTESTPKG::MPC_LKREQUEST"))
(unless (find-package "RCTESTPKG::MPC_LKRESPONSE")
  (make-package "RCTESTPKG::MPC_LKRESPONSE"))

(in-package "ROS")





(defclass rctestpkg::MPC_LKRequest
  :super ros::object
  :slots (_y0 _v0 _p0 _r0 _s0 _wy _wv _wp _wr _ws _y_max _y_min _v_max _p_max _r_max _s_max _A _B _E _rd ))

(defmethod rctestpkg::MPC_LKRequest
  (:init
   (&key
    ((:y0 __y0) 0.0)
    ((:v0 __v0) 0.0)
    ((:p0 __p0) 0.0)
    ((:r0 __r0) 0.0)
    ((:s0 __s0) 0.0)
    ((:wy __wy) 0.0)
    ((:wv __wv) 0.0)
    ((:wp __wp) 0.0)
    ((:wr __wr) 0.0)
    ((:ws __ws) 0.0)
    ((:y_max __y_max) 0.0)
    ((:y_min __y_min) 0.0)
    ((:v_max __v_max) 0.0)
    ((:p_max __p_max) 0.0)
    ((:r_max __r_max) 0.0)
    ((:s_max __s_max) 0.0)
    ((:A __A) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:B __B) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:E __E) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:rd __rd) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _y0 (float __y0))
   (setq _v0 (float __v0))
   (setq _p0 (float __p0))
   (setq _r0 (float __r0))
   (setq _s0 (float __s0))
   (setq _wy (float __wy))
   (setq _wv (float __wv))
   (setq _wp (float __wp))
   (setq _wr (float __wr))
   (setq _ws (float __ws))
   (setq _y_max (float __y_max))
   (setq _y_min (float __y_min))
   (setq _v_max (float __v_max))
   (setq _p_max (float __p_max))
   (setq _r_max (float __r_max))
   (setq _s_max (float __s_max))
   (setq _A __A)
   (setq _B __B)
   (setq _E __E)
   (setq _rd __rd)
   self)
  (:y0
   (&optional __y0)
   (if __y0 (setq _y0 __y0)) _y0)
  (:v0
   (&optional __v0)
   (if __v0 (setq _v0 __v0)) _v0)
  (:p0
   (&optional __p0)
   (if __p0 (setq _p0 __p0)) _p0)
  (:r0
   (&optional __r0)
   (if __r0 (setq _r0 __r0)) _r0)
  (:s0
   (&optional __s0)
   (if __s0 (setq _s0 __s0)) _s0)
  (:wy
   (&optional __wy)
   (if __wy (setq _wy __wy)) _wy)
  (:wv
   (&optional __wv)
   (if __wv (setq _wv __wv)) _wv)
  (:wp
   (&optional __wp)
   (if __wp (setq _wp __wp)) _wp)
  (:wr
   (&optional __wr)
   (if __wr (setq _wr __wr)) _wr)
  (:ws
   (&optional __ws)
   (if __ws (setq _ws __ws)) _ws)
  (:y_max
   (&optional __y_max)
   (if __y_max (setq _y_max __y_max)) _y_max)
  (:y_min
   (&optional __y_min)
   (if __y_min (setq _y_min __y_min)) _y_min)
  (:v_max
   (&optional __v_max)
   (if __v_max (setq _v_max __v_max)) _v_max)
  (:p_max
   (&optional __p_max)
   (if __p_max (setq _p_max __p_max)) _p_max)
  (:r_max
   (&optional __r_max)
   (if __r_max (setq _r_max __r_max)) _r_max)
  (:s_max
   (&optional __s_max)
   (if __s_max (setq _s_max __s_max)) _s_max)
  (:A
   (&optional __A)
   (if __A (setq _A __A)) _A)
  (:B
   (&optional __B)
   (if __B (setq _B __B)) _B)
  (:E
   (&optional __E)
   (if __E (setq _E __E)) _E)
  (:rd
   (&optional __rd)
   (if __rd (setq _rd __rd)) _rd)
  (:serialization-length
   ()
   (+
    ;; float64 _y0
    8
    ;; float64 _v0
    8
    ;; float64 _p0
    8
    ;; float64 _r0
    8
    ;; float64 _s0
    8
    ;; float64 _wy
    8
    ;; float64 _wv
    8
    ;; float64 _wp
    8
    ;; float64 _wr
    8
    ;; float64 _ws
    8
    ;; float64 _y_max
    8
    ;; float64 _y_min
    8
    ;; float64 _v_max
    8
    ;; float64 _p_max
    8
    ;; float64 _r_max
    8
    ;; float64 _s_max
    8
    ;; float64[] _A
    (* 8    (length _A)) 4
    ;; float64[] _B
    (* 8    (length _B)) 4
    ;; float64[] _E
    (* 8    (length _E)) 4
    ;; float64[] _rd
    (* 8    (length _rd)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _y0
       (sys::poke _y0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v0
       (sys::poke _v0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _p0
       (sys::poke _p0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _r0
       (sys::poke _r0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _s0
       (sys::poke _s0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wy
       (sys::poke _wy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wv
       (sys::poke _wv (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wp
       (sys::poke _wp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wr
       (sys::poke _wr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ws
       (sys::poke _ws (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_max
       (sys::poke _y_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_min
       (sys::poke _y_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v_max
       (sys::poke _v_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _p_max
       (sys::poke _p_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _r_max
       (sys::poke _r_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _s_max
       (sys::poke _s_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[] _A
     (write-long (length _A) s)
     (dotimes (i (length _A))
       (sys::poke (elt _A i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _B
     (write-long (length _B) s)
     (dotimes (i (length _B))
       (sys::poke (elt _B i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _E
     (write-long (length _E) s)
     (dotimes (i (length _E))
       (sys::poke (elt _E i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _rd
     (write-long (length _rd) s)
     (dotimes (i (length _rd))
       (sys::poke (elt _rd i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _y0
     (setq _y0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v0
     (setq _v0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _p0
     (setq _p0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _r0
     (setq _r0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _s0
     (setq _s0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wy
     (setq _wy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wv
     (setq _wv (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wp
     (setq _wp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wr
     (setq _wr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ws
     (setq _ws (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_max
     (setq _y_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_min
     (setq _y_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v_max
     (setq _v_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _p_max
     (setq _p_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _r_max
     (setq _r_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _s_max
     (setq _s_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[] _A
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _A (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _A i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _B
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _B (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _B i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _E
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _E (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _E i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _rd
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rd (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _rd i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass rctestpkg::MPC_LKResponse
  :super ros::object
  :slots (_s ))

(defmethod rctestpkg::MPC_LKResponse
  (:init
   (&key
    ((:s __s) 0.0)
    )
   (send-super :init)
   (setq _s (float __s))
   self)
  (:s
   (&optional __s)
   (if __s (setq _s __s)) _s)
  (:serialization-length
   ()
   (+
    ;; float64 _s
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _s
       (sys::poke _s (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _s
     (setq _s (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass rctestpkg::MPC_LK
  :super ros::object
  :slots ())

(setf (get rctestpkg::MPC_LK :md5sum-) "07ec41d26dcbce48a88bfe9b463548bd")
(setf (get rctestpkg::MPC_LK :datatype-) "rctestpkg/MPC_LK")
(setf (get rctestpkg::MPC_LK :request) rctestpkg::MPC_LKRequest)
(setf (get rctestpkg::MPC_LK :response) rctestpkg::MPC_LKResponse)

(defmethod rctestpkg::MPC_LKRequest
  (:response () (instance rctestpkg::MPC_LKResponse :init)))

(setf (get rctestpkg::MPC_LKRequest :md5sum-) "07ec41d26dcbce48a88bfe9b463548bd")
(setf (get rctestpkg::MPC_LKRequest :datatype-) "rctestpkg/MPC_LKRequest")
(setf (get rctestpkg::MPC_LKRequest :definition-)
      "float64 y0
float64 v0
float64 p0
float64 r0
float64 s0
float64 wy
float64 wv
float64 wp
float64 wr
float64 ws
float64 y_max
float64 y_min
float64 v_max
float64 p_max
float64 r_max
float64 s_max
float64[] A
float64[] B
float64[] E
float64[] rd
---
float64 s

")

(setf (get rctestpkg::MPC_LKResponse :md5sum-) "07ec41d26dcbce48a88bfe9b463548bd")
(setf (get rctestpkg::MPC_LKResponse :datatype-) "rctestpkg/MPC_LKResponse")
(setf (get rctestpkg::MPC_LKResponse :definition-)
      "float64 y0
float64 v0
float64 p0
float64 r0
float64 s0
float64 wy
float64 wv
float64 wp
float64 wr
float64 ws
float64 y_max
float64 y_min
float64 v_max
float64 p_max
float64 r_max
float64 s_max
float64[] A
float64[] B
float64[] E
float64[] rd
---
float64 s

")



(provide :rctestpkg/MPC_LK "07ec41d26dcbce48a88bfe9b463548bd")


