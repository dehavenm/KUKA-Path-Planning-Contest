;; Auto-generated. Do not edit!


(when (boundp 'rll_msgs::JobExtraField)
  (if (not (find-package "RLL_MSGS"))
    (make-package "RLL_MSGS"))
  (shadow 'JobExtraField (find-package "RLL_MSGS")))
(unless (find-package "RLL_MSGS::JOBEXTRAFIELD")
  (make-package "RLL_MSGS::JOBEXTRAFIELD"))

(in-package "ROS")
;;//! \htmlinclude JobExtraField.msg.html


(defclass rll_msgs::JobExtraField
  :super ros::object
  :slots (_description _value ))

(defmethod rll_msgs::JobExtraField
  (:init
   (&key
    ((:description __description) "")
    ((:value __value) 0.0)
    )
   (send-super :init)
   (setq _description (string __description))
   (setq _value (float __value))
   self)
  (:description
   (&optional __description)
   (if __description (setq _description __description)) _description)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; string _description
    4 (length _description)
    ;; float32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _description
       (write-long (length _description) s) (princ _description s)
     ;; float32 _value
       (sys::poke _value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _description
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _description (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _value
     (setq _value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rll_msgs::JobExtraField :md5sum-) "b164c1ce471f8c5265ae1e8d22c2ca20")
(setf (get rll_msgs::JobExtraField :datatype-) "rll_msgs/JobExtraField")
(setf (get rll_msgs::JobExtraField :definition-)
      "string description
float32 value

")



(provide :rll_msgs/JobExtraField "b164c1ce471f8c5265ae1e8d22c2ca20")


