;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::CentralSignal)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'CentralSignal (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::CENTRALSIGNAL")
  (make-package "RCTESTPKG::CENTRALSIGNAL"))

(in-package "ROS")
;;//! \htmlinclude CentralSignal.msg.html


(defclass rctestpkg::CentralSignal
  :super ros::object
  :slots (_lanekeeping _right_lane _cruise_control _stop _command_v _servo_pwm ))

(defmethod rctestpkg::CentralSignal
  (:init
   (&key
    ((:lanekeeping __lanekeeping) nil)
    ((:right_lane __right_lane) nil)
    ((:cruise_control __cruise_control) nil)
    ((:stop __stop) nil)
    ((:command_v __command_v) 0.0)
    ((:servo_pwm __servo_pwm) 0)
    )
   (send-super :init)
   (setq _lanekeeping __lanekeeping)
   (setq _right_lane __right_lane)
   (setq _cruise_control __cruise_control)
   (setq _stop __stop)
   (setq _command_v (float __command_v))
   (setq _servo_pwm (round __servo_pwm))
   self)
  (:lanekeeping
   (&optional __lanekeeping)
   (if __lanekeeping (setq _lanekeeping __lanekeeping)) _lanekeeping)
  (:right_lane
   (&optional __right_lane)
   (if __right_lane (setq _right_lane __right_lane)) _right_lane)
  (:cruise_control
   (&optional __cruise_control)
   (if __cruise_control (setq _cruise_control __cruise_control)) _cruise_control)
  (:stop
   (&optional __stop)
   (if __stop (setq _stop __stop)) _stop)
  (:command_v
   (&optional __command_v)
   (if __command_v (setq _command_v __command_v)) _command_v)
  (:servo_pwm
   (&optional __servo_pwm)
   (if __servo_pwm (setq _servo_pwm __servo_pwm)) _servo_pwm)
  (:serialization-length
   ()
   (+
    ;; bool _lanekeeping
    1
    ;; bool _right_lane
    1
    ;; bool _cruise_control
    1
    ;; bool _stop
    1
    ;; float64 _command_v
    8
    ;; uint16 _servo_pwm
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _lanekeeping
       (if _lanekeeping (write-byte -1 s) (write-byte 0 s))
     ;; bool _right_lane
       (if _right_lane (write-byte -1 s) (write-byte 0 s))
     ;; bool _cruise_control
       (if _cruise_control (write-byte -1 s) (write-byte 0 s))
     ;; bool _stop
       (if _stop (write-byte -1 s) (write-byte 0 s))
     ;; float64 _command_v
       (sys::poke _command_v (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16 _servo_pwm
       (write-word _servo_pwm s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _lanekeeping
     (setq _lanekeeping (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _right_lane
     (setq _right_lane (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _cruise_control
     (setq _cruise_control (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _stop
     (setq _stop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _command_v
     (setq _command_v (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _servo_pwm
     (setq _servo_pwm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get rctestpkg::CentralSignal :md5sum-) "7d4286309f6e1dd55dc49e54e2e770cf")
(setf (get rctestpkg::CentralSignal :datatype-) "rctestpkg/CentralSignal")
(setf (get rctestpkg::CentralSignal :definition-)
      "bool lanekeeping
bool right_lane
bool cruise_control
bool stop
float64 command_v
uint16 servo_pwm

")



(provide :rctestpkg/CentralSignal "7d4286309f6e1dd55dc49e54e2e770cf")


