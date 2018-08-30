;; Auto-generated. Do not edit!


(when (boundp 'rctestpkg::animalAge)
  (if (not (find-package "RCTESTPKG"))
    (make-package "RCTESTPKG"))
  (shadow 'animalAge (find-package "RCTESTPKG")))
(unless (find-package "RCTESTPKG::ANIMALAGE")
  (make-package "RCTESTPKG::ANIMALAGE"))

(in-package "ROS")
;;//! \htmlinclude animalAge.msg.html


(defclass rctestpkg::animalAge
  :super ros::object
  :slots (_species _age ))

(defmethod rctestpkg::animalAge
  (:init
   (&key
    ((:species __species) "")
    ((:age __age) 0)
    )
   (send-super :init)
   (setq _species (string __species))
   (setq _age (round __age))
   self)
  (:species
   (&optional __species)
   (if __species (setq _species __species)) _species)
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:serialization-length
   ()
   (+
    ;; string _species
    4 (length _species)
    ;; int64 _age
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _species
       (write-long (length _species) s) (princ _species s)
     ;; int64 _age
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _age (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _age) (= (length (_age . bv)) 2)) ;; bignum
              (write-long (ash (elt (_age . bv) 0) 0) s)
              (write-long (ash (elt (_age . bv) 1) -1) s))
             ((and (class _age) (= (length (_age . bv)) 1)) ;; big1
              (write-long (elt (_age . bv) 0) s)
              (write-long (if (>= _age 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _age s)(write-long (if (>= _age 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _species
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _species (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _age
#+(or :alpha :irix6 :x86_64)
      (setf _age (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _age (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get rctestpkg::animalAge :md5sum-) "18f4dd8d566c5f3748f449c6cf5dda79")
(setf (get rctestpkg::animalAge :datatype-) "rctestpkg/animalAge")
(setf (get rctestpkg::animalAge :definition-)
      "string species
int64 age

")



(provide :rctestpkg/animalAge "18f4dd8d566c5f3748f449c6cf5dda79")


