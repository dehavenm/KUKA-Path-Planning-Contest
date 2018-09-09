;; Auto-generated. Do not edit!


(when (boundp 'rll_msgs::PickPlace)
  (if (not (find-package "RLL_MSGS"))
    (make-package "RLL_MSGS"))
  (shadow 'PickPlace (find-package "RLL_MSGS")))
(unless (find-package "RLL_MSGS::PICKPLACE")
  (make-package "RLL_MSGS::PICKPLACE"))
(unless (find-package "RLL_MSGS::PICKPLACEREQUEST")
  (make-package "RLL_MSGS::PICKPLACEREQUEST"))
(unless (find-package "RLL_MSGS::PICKPLACERESPONSE")
  (make-package "RLL_MSGS::PICKPLACERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass rll_msgs::PickPlaceRequest
  :super ros::object
  :slots (_pose_above _pose_grip _gripper_close _grasp_object ))

(defmethod rll_msgs::PickPlaceRequest
  (:init
   (&key
    ((:pose_above __pose_above) (instance geometry_msgs::Pose :init))
    ((:pose_grip __pose_grip) (instance geometry_msgs::Pose :init))
    ((:gripper_close __gripper_close) nil)
    ((:grasp_object __grasp_object) "")
    )
   (send-super :init)
   (setq _pose_above __pose_above)
   (setq _pose_grip __pose_grip)
   (setq _gripper_close __gripper_close)
   (setq _grasp_object (string __grasp_object))
   self)
  (:pose_above
   (&rest __pose_above)
   (if (keywordp (car __pose_above))
       (send* _pose_above __pose_above)
     (progn
       (if __pose_above (setq _pose_above (car __pose_above)))
       _pose_above)))
  (:pose_grip
   (&rest __pose_grip)
   (if (keywordp (car __pose_grip))
       (send* _pose_grip __pose_grip)
     (progn
       (if __pose_grip (setq _pose_grip (car __pose_grip)))
       _pose_grip)))
  (:gripper_close
   (&optional __gripper_close)
   (if __gripper_close (setq _gripper_close __gripper_close)) _gripper_close)
  (:grasp_object
   (&optional __grasp_object)
   (if __grasp_object (setq _grasp_object __grasp_object)) _grasp_object)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose_above
    (send _pose_above :serialization-length)
    ;; geometry_msgs/Pose _pose_grip
    (send _pose_grip :serialization-length)
    ;; bool _gripper_close
    1
    ;; string _grasp_object
    4 (length _grasp_object)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose_above
       (send _pose_above :serialize s)
     ;; geometry_msgs/Pose _pose_grip
       (send _pose_grip :serialize s)
     ;; bool _gripper_close
       (if _gripper_close (write-byte -1 s) (write-byte 0 s))
     ;; string _grasp_object
       (write-long (length _grasp_object) s) (princ _grasp_object s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose_above
     (send _pose_above :deserialize buf ptr-) (incf ptr- (send _pose_above :serialization-length))
   ;; geometry_msgs/Pose _pose_grip
     (send _pose_grip :deserialize buf ptr-) (incf ptr- (send _pose_grip :serialization-length))
   ;; bool _gripper_close
     (setq _gripper_close (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _grasp_object
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _grasp_object (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass rll_msgs::PickPlaceResponse
  :super ros::object
  :slots (_success ))

(defmethod rll_msgs::PickPlaceResponse
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

(defclass rll_msgs::PickPlace
  :super ros::object
  :slots ())

(setf (get rll_msgs::PickPlace :md5sum-) "f9e1ce2e36454c554259d3461e945fff")
(setf (get rll_msgs::PickPlace :datatype-) "rll_msgs/PickPlace")
(setf (get rll_msgs::PickPlace :request) rll_msgs::PickPlaceRequest)
(setf (get rll_msgs::PickPlace :response) rll_msgs::PickPlaceResponse)

(defmethod rll_msgs::PickPlaceRequest
  (:response () (instance rll_msgs::PickPlaceResponse :init)))

(setf (get rll_msgs::PickPlaceRequest :md5sum-) "f9e1ce2e36454c554259d3461e945fff")
(setf (get rll_msgs::PickPlaceRequest :datatype-) "rll_msgs/PickPlaceRequest")
(setf (get rll_msgs::PickPlaceRequest :definition-)
      "geometry_msgs/Pose pose_above
geometry_msgs/Pose pose_grip
bool gripper_close
string grasp_object

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

(setf (get rll_msgs::PickPlaceResponse :md5sum-) "f9e1ce2e36454c554259d3461e945fff")
(setf (get rll_msgs::PickPlaceResponse :datatype-) "rll_msgs/PickPlaceResponse")
(setf (get rll_msgs::PickPlaceResponse :definition-)
      "geometry_msgs/Pose pose_above
geometry_msgs/Pose pose_grip
bool gripper_close
string grasp_object

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



(provide :rll_msgs/PickPlace "f9e1ce2e36454c554259d3461e945fff")


