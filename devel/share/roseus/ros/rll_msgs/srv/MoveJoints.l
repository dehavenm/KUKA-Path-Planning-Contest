;; Auto-generated. Do not edit!


(when (boundp 'rll_msgs::MoveJoints)
  (if (not (find-package "RLL_MSGS"))
    (make-package "RLL_MSGS"))
  (shadow 'MoveJoints (find-package "RLL_MSGS")))
(unless (find-package "RLL_MSGS::MOVEJOINTS")
  (make-package "RLL_MSGS::MOVEJOINTS"))
(unless (find-package "RLL_MSGS::MOVEJOINTSREQUEST")
  (make-package "RLL_MSGS::MOVEJOINTSREQUEST"))
(unless (find-package "RLL_MSGS::MOVEJOINTSRESPONSE")
  (make-package "RLL_MSGS::MOVEJOINTSRESPONSE"))

(in-package "ROS")





(defclass rll_msgs::MoveJointsRequest
  :super ros::object
  :slots (_joint_1 _joint_2 _joint_3 _joint_4 _joint_5 _joint_6 _joint_7 ))

(defmethod rll_msgs::MoveJointsRequest
  (:init
   (&key
    ((:joint_1 __joint_1) 0.0)
    ((:joint_2 __joint_2) 0.0)
    ((:joint_3 __joint_3) 0.0)
    ((:joint_4 __joint_4) 0.0)
    ((:joint_5 __joint_5) 0.0)
    ((:joint_6 __joint_6) 0.0)
    ((:joint_7 __joint_7) 0.0)
    )
   (send-super :init)
   (setq _joint_1 (float __joint_1))
   (setq _joint_2 (float __joint_2))
   (setq _joint_3 (float __joint_3))
   (setq _joint_4 (float __joint_4))
   (setq _joint_5 (float __joint_5))
   (setq _joint_6 (float __joint_6))
   (setq _joint_7 (float __joint_7))
   self)
  (:joint_1
   (&optional __joint_1)
   (if __joint_1 (setq _joint_1 __joint_1)) _joint_1)
  (:joint_2
   (&optional __joint_2)
   (if __joint_2 (setq _joint_2 __joint_2)) _joint_2)
  (:joint_3
   (&optional __joint_3)
   (if __joint_3 (setq _joint_3 __joint_3)) _joint_3)
  (:joint_4
   (&optional __joint_4)
   (if __joint_4 (setq _joint_4 __joint_4)) _joint_4)
  (:joint_5
   (&optional __joint_5)
   (if __joint_5 (setq _joint_5 __joint_5)) _joint_5)
  (:joint_6
   (&optional __joint_6)
   (if __joint_6 (setq _joint_6 __joint_6)) _joint_6)
  (:joint_7
   (&optional __joint_7)
   (if __joint_7 (setq _joint_7 __joint_7)) _joint_7)
  (:serialization-length
   ()
   (+
    ;; float64 _joint_1
    8
    ;; float64 _joint_2
    8
    ;; float64 _joint_3
    8
    ;; float64 _joint_4
    8
    ;; float64 _joint_5
    8
    ;; float64 _joint_6
    8
    ;; float64 _joint_7
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _joint_1
       (sys::poke _joint_1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_2
       (sys::poke _joint_2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_3
       (sys::poke _joint_3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_4
       (sys::poke _joint_4 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_5
       (sys::poke _joint_5 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_6
       (sys::poke _joint_6 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_7
       (sys::poke _joint_7 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _joint_1
     (setq _joint_1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_2
     (setq _joint_2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_3
     (setq _joint_3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_4
     (setq _joint_4 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_5
     (setq _joint_5 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_6
     (setq _joint_6 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_7
     (setq _joint_7 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass rll_msgs::MoveJointsResponse
  :super ros::object
  :slots (_success ))

(defmethod rll_msgs::MoveJointsResponse
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

(defclass rll_msgs::MoveJoints
  :super ros::object
  :slots ())

(setf (get rll_msgs::MoveJoints :md5sum-) "3149fa57d6259ba20b53e062ad6ad334")
(setf (get rll_msgs::MoveJoints :datatype-) "rll_msgs/MoveJoints")
(setf (get rll_msgs::MoveJoints :request) rll_msgs::MoveJointsRequest)
(setf (get rll_msgs::MoveJoints :response) rll_msgs::MoveJointsResponse)

(defmethod rll_msgs::MoveJointsRequest
  (:response () (instance rll_msgs::MoveJointsResponse :init)))

(setf (get rll_msgs::MoveJointsRequest :md5sum-) "3149fa57d6259ba20b53e062ad6ad334")
(setf (get rll_msgs::MoveJointsRequest :datatype-) "rll_msgs/MoveJointsRequest")
(setf (get rll_msgs::MoveJointsRequest :definition-)
      "float64 joint_1
float64 joint_2
float64 joint_3
float64 joint_4
float64 joint_5
float64 joint_6
float64 joint_7
---
bool success
")

(setf (get rll_msgs::MoveJointsResponse :md5sum-) "3149fa57d6259ba20b53e062ad6ad334")
(setf (get rll_msgs::MoveJointsResponse :datatype-) "rll_msgs/MoveJointsResponse")
(setf (get rll_msgs::MoveJointsResponse :definition-)
      "float64 joint_1
float64 joint_2
float64 joint_3
float64 joint_4
float64 joint_5
float64 joint_6
float64 joint_7
---
bool success
")



(provide :rll_msgs/MoveJoints "3149fa57d6259ba20b53e062ad6ad334")


