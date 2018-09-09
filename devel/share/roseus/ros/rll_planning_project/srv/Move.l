;; Auto-generated. Do not edit!


(when (boundp 'rll_planning_project::Move)
  (if (not (find-package "RLL_PLANNING_PROJECT"))
    (make-package "RLL_PLANNING_PROJECT"))
  (shadow 'Move (find-package "RLL_PLANNING_PROJECT")))
(unless (find-package "RLL_PLANNING_PROJECT::MOVE")
  (make-package "RLL_PLANNING_PROJECT::MOVE"))
(unless (find-package "RLL_PLANNING_PROJECT::MOVEREQUEST")
  (make-package "RLL_PLANNING_PROJECT::MOVEREQUEST"))
(unless (find-package "RLL_PLANNING_PROJECT::MOVERESPONSE")
  (make-package "RLL_PLANNING_PROJECT::MOVERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass rll_planning_project::MoveRequest
  :super ros::object
  :slots (_pose ))

(defmethod rll_planning_project::MoveRequest
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose2D :init))
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
    ;; geometry_msgs/Pose2D _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass rll_planning_project::MoveResponse
  :super ros::object
  :slots (_success ))

(defmethod rll_planning_project::MoveResponse
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

(defclass rll_planning_project::Move
  :super ros::object
  :slots ())

(setf (get rll_planning_project::Move :md5sum-) "cfc42ebcb6ac1e961d822c446b9526a0")
(setf (get rll_planning_project::Move :datatype-) "rll_planning_project/Move")
(setf (get rll_planning_project::Move :request) rll_planning_project::MoveRequest)
(setf (get rll_planning_project::Move :response) rll_planning_project::MoveResponse)

(defmethod rll_planning_project::MoveRequest
  (:response () (instance rll_planning_project::MoveResponse :init)))

(setf (get rll_planning_project::MoveRequest :md5sum-) "cfc42ebcb6ac1e961d822c446b9526a0")
(setf (get rll_planning_project::MoveRequest :datatype-) "rll_planning_project/MoveRequest")
(setf (get rll_planning_project::MoveRequest :definition-)
      "geometry_msgs/Pose2D pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---
bool success

")

(setf (get rll_planning_project::MoveResponse :md5sum-) "cfc42ebcb6ac1e961d822c446b9526a0")
(setf (get rll_planning_project::MoveResponse :datatype-) "rll_planning_project/MoveResponse")
(setf (get rll_planning_project::MoveResponse :definition-)
      "geometry_msgs/Pose2D pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---
bool success

")



(provide :rll_planning_project/Move "cfc42ebcb6ac1e961d822c446b9526a0")


