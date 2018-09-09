;; Auto-generated. Do not edit!


(when (boundp 'rll_msgs::MovePTP)
  (if (not (find-package "RLL_MSGS"))
    (make-package "RLL_MSGS"))
  (shadow 'MovePTP (find-package "RLL_MSGS")))
(unless (find-package "RLL_MSGS::MOVEPTP")
  (make-package "RLL_MSGS::MOVEPTP"))
(unless (find-package "RLL_MSGS::MOVEPTPREQUEST")
  (make-package "RLL_MSGS::MOVEPTPREQUEST"))
(unless (find-package "RLL_MSGS::MOVEPTPRESPONSE")
  (make-package "RLL_MSGS::MOVEPTPRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass rll_msgs::MovePTPRequest
  :super ros::object
  :slots (_pose ))

(defmethod rll_msgs::MovePTPRequest
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass rll_msgs::MovePTPResponse
  :super ros::object
  :slots (_success ))

(defmethod rll_msgs::MovePTPResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass rll_msgs::MovePTP
  :super ros::object
  :slots ())

(setf (get rll_msgs::MovePTP :md5sum-) "b66f4c8c2fa81b98544cf0f3e10950ee")
(setf (get rll_msgs::MovePTP :datatype-) "rll_msgs/MovePTP")
(setf (get rll_msgs::MovePTP :request) rll_msgs::MovePTPRequest)
(setf (get rll_msgs::MovePTP :response) rll_msgs::MovePTPResponse)

(defmethod rll_msgs::MovePTPRequest
  (:response () (instance rll_msgs::MovePTPResponse :init)))

(setf (get rll_msgs::MovePTPRequest :md5sum-) "b66f4c8c2fa81b98544cf0f3e10950ee")
(setf (get rll_msgs::MovePTPRequest :datatype-) "rll_msgs/MovePTPRequest")
(setf (get rll_msgs::MovePTPRequest :definition-)
      "geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success

")

(setf (get rll_msgs::MovePTPResponse :md5sum-) "b66f4c8c2fa81b98544cf0f3e10950ee")
(setf (get rll_msgs::MovePTPResponse :datatype-) "rll_msgs/MovePTPResponse")
(setf (get rll_msgs::MovePTPResponse :definition-)
      "geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success

")



(provide :rll_msgs/MovePTP "b66f4c8c2fa81b98544cf0f3e10950ee")


