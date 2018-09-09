;; Auto-generated. Do not edit!


(when (boundp 'rll_planning_project::CheckPath)
  (if (not (find-package "RLL_PLANNING_PROJECT"))
    (make-package "RLL_PLANNING_PROJECT"))
  (shadow 'CheckPath (find-package "RLL_PLANNING_PROJECT")))
(unless (find-package "RLL_PLANNING_PROJECT::CHECKPATH")
  (make-package "RLL_PLANNING_PROJECT::CHECKPATH"))
(unless (find-package "RLL_PLANNING_PROJECT::CHECKPATHREQUEST")
  (make-package "RLL_PLANNING_PROJECT::CHECKPATHREQUEST"))
(unless (find-package "RLL_PLANNING_PROJECT::CHECKPATHRESPONSE")
  (make-package "RLL_PLANNING_PROJECT::CHECKPATHRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass rll_planning_project::CheckPathRequest
  :super ros::object
  :slots (_pose_start _pose_goal ))

(defmethod rll_planning_project::CheckPathRequest
  (:init
   (&key
    ((:pose_start __pose_start) (instance geometry_msgs::Pose2D :init))
    ((:pose_goal __pose_goal) (instance geometry_msgs::Pose2D :init))
    )
   (send-super :init)
   (setq _pose_start __pose_start)
   (setq _pose_goal __pose_goal)
   self)
  (:pose_start
   (&rest __pose_start)
   (if (keywordp (car __pose_start))
       (send* _pose_start __pose_start)
     (progn
       (if __pose_start (setq _pose_start (car __pose_start)))
       _pose_start)))
  (:pose_goal
   (&rest __pose_goal)
   (if (keywordp (car __pose_goal))
       (send* _pose_goal __pose_goal)
     (progn
       (if __pose_goal (setq _pose_goal (car __pose_goal)))
       _pose_goal)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose2D _pose_start
    (send _pose_start :serialization-length)
    ;; geometry_msgs/Pose2D _pose_goal
    (send _pose_goal :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _pose_start
       (send _pose_start :serialize s)
     ;; geometry_msgs/Pose2D _pose_goal
       (send _pose_goal :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _pose_start
     (send _pose_start :deserialize buf ptr-) (incf ptr- (send _pose_start :serialization-length))
   ;; geometry_msgs/Pose2D _pose_goal
     (send _pose_goal :deserialize buf ptr-) (incf ptr- (send _pose_goal :serialization-length))
   ;;
   self)
  )

(defclass rll_planning_project::CheckPathResponse
  :super ros::object
  :slots (_valid ))

(defmethod rll_planning_project::CheckPathResponse
  (:init
   (&key
    ((:valid __valid) nil)
    )
   (send-super :init)
   (setq _valid __valid)
   self)
  (:valid
   (&optional __valid)
   (if __valid (setq _valid __valid)) _valid)
  (:serialization-length
   ()
   (+
    ;; bool _valid
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _valid
       (if _valid (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _valid
     (setq _valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass rll_planning_project::CheckPath
  :super ros::object
  :slots ())

(setf (get rll_planning_project::CheckPath :md5sum-) "9853809de3dea14e77435e7b0de1d74a")
(setf (get rll_planning_project::CheckPath :datatype-) "rll_planning_project/CheckPath")
(setf (get rll_planning_project::CheckPath :request) rll_planning_project::CheckPathRequest)
(setf (get rll_planning_project::CheckPath :response) rll_planning_project::CheckPathResponse)

(defmethod rll_planning_project::CheckPathRequest
  (:response () (instance rll_planning_project::CheckPathResponse :init)))

(setf (get rll_planning_project::CheckPathRequest :md5sum-) "9853809de3dea14e77435e7b0de1d74a")
(setf (get rll_planning_project::CheckPathRequest :datatype-) "rll_planning_project/CheckPathRequest")
(setf (get rll_planning_project::CheckPathRequest :definition-)
      "geometry_msgs/Pose2D pose_start
geometry_msgs/Pose2D pose_goal

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---
bool valid

")

(setf (get rll_planning_project::CheckPathResponse :md5sum-) "9853809de3dea14e77435e7b0de1d74a")
(setf (get rll_planning_project::CheckPathResponse :datatype-) "rll_planning_project/CheckPathResponse")
(setf (get rll_planning_project::CheckPathResponse :definition-)
      "geometry_msgs/Pose2D pose_start
geometry_msgs/Pose2D pose_goal

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---
bool valid

")



(provide :rll_planning_project/CheckPath "9853809de3dea14e77435e7b0de1d74a")


