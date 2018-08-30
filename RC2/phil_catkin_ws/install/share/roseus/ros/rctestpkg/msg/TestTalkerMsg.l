;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::TestTalkerMsg)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'TestTalkerMsg (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::TESTTALKERMSG")
  (make-package "RCTESTPKG::TESTTALKERMSG"))

(in-package "ROS")
;;//! \htmlinclude TestTalkerMsg.msg.html


(defclass rctestpkg::TestTalkerMsg
  :super ros::object
  :slots (_TestTalkerString _TestTalkerInt ))

(defmethod rctestpkg::TestTalkerMsg
  (:init
   (&key
    ((:TestTalkerString __TestTalkerString) "")
    ((:TestTalkerInt __TestTalkerInt) 0)
    )
   (send-super :init)
   (setq _TestTalkerString (string __TestTalkerString))
   (setq _TestTalkerInt (round __TestTalkerInt))
   self)
  (:TestTalkerString
   (&optional __TestTalkerString)
   (if __TestTalkerString (setq _TestTalkerString __TestTalkerString)) _TestTalkerString)
  (:TestTalkerInt
   (&optional __TestTalkerInt)
   (if __TestTalkerInt (setq _TestTalkerInt __TestTalkerInt)) _TestTalkerInt)
  (:serialization-length
   ()
   (+
    ;; string _TestTalkerString
    4 (length _TestTalkerString)
    ;; int64 _TestTalkerInt
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _TestTalkerString
       (write-long (length _TestTalkerString) s) (princ _TestTalkerString s)
     ;; int64 _TestTalkerInt
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _TestTalkerInt (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _TestTalkerInt) (= (length (_TestTalkerInt . bv)) 2)) ;; bignum
              (write-long (ash (elt (_TestTalkerInt . bv) 0) 0) s)
              (write-long (ash (elt (_TestTalkerInt . bv) 1) -1) s))
             ((and (class _TestTalkerInt) (= (length (_TestTalkerInt . bv)) 1)) ;; big1
              (write-long (elt (_TestTalkerInt . bv) 0) s)
              (write-long (if (>= _TestTalkerInt 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _TestTalkerInt s)(write-long (if (>= _TestTalkerInt 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _TestTalkerString
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _TestTalkerString (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _TestTalkerInt
#+(or :alpha :irix6 :x86_64)
      (setf _TestTalkerInt (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _TestTalkerInt (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get rctestpkg::TestTalkerMsg :md5sum-) "f02eee63b61a8f52d495bcf6a0b81c9a")
(setf (get rctestpkg::TestTalkerMsg :datatype-) "rctestpkg/TestTalkerMsg")
(setf (get rctestpkg::TestTalkerMsg :definition-)
      "string TestTalkerString
int64 TestTalkerInt

")



(provide :rctestpkg/TestTalkerMsg "f02eee63b61a8f52d495bcf6a0b81c9a")


