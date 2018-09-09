; Auto-generated. Do not edit!


(cl:in-package rll_planning_project-srv)


;//! \htmlinclude CheckPath-request.msg.html

(cl:defclass <CheckPath-request> (roslisp-msg-protocol:ros-message)
  ((pose_start
    :reader pose_start
    :initarg :pose_start
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D))
   (pose_goal
    :reader pose_goal
    :initarg :pose_goal
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass CheckPath-request (<CheckPath-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckPath-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckPath-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_planning_project-srv:<CheckPath-request> is deprecated: use rll_planning_project-srv:CheckPath-request instead.")))

(cl:ensure-generic-function 'pose_start-val :lambda-list '(m))
(cl:defmethod pose_start-val ((m <CheckPath-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_planning_project-srv:pose_start-val is deprecated.  Use rll_planning_project-srv:pose_start instead.")
  (pose_start m))

(cl:ensure-generic-function 'pose_goal-val :lambda-list '(m))
(cl:defmethod pose_goal-val ((m <CheckPath-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_planning_project-srv:pose_goal-val is deprecated.  Use rll_planning_project-srv:pose_goal instead.")
  (pose_goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckPath-request>) ostream)
  "Serializes a message object of type '<CheckPath-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose_start) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose_goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckPath-request>) istream)
  "Deserializes a message object of type '<CheckPath-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose_start) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose_goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckPath-request>)))
  "Returns string type for a service object of type '<CheckPath-request>"
  "rll_planning_project/CheckPathRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckPath-request)))
  "Returns string type for a service object of type 'CheckPath-request"
  "rll_planning_project/CheckPathRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckPath-request>)))
  "Returns md5sum for a message object of type '<CheckPath-request>"
  "9853809de3dea14e77435e7b0de1d74a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckPath-request)))
  "Returns md5sum for a message object of type 'CheckPath-request"
  "9853809de3dea14e77435e7b0de1d74a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckPath-request>)))
  "Returns full string definition for message of type '<CheckPath-request>"
  (cl:format cl:nil "geometry_msgs/Pose2D pose_start~%geometry_msgs/Pose2D pose_goal~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckPath-request)))
  "Returns full string definition for message of type 'CheckPath-request"
  (cl:format cl:nil "geometry_msgs/Pose2D pose_start~%geometry_msgs/Pose2D pose_goal~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckPath-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose_start))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose_goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckPath-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckPath-request
    (cl:cons ':pose_start (pose_start msg))
    (cl:cons ':pose_goal (pose_goal msg))
))
;//! \htmlinclude CheckPath-response.msg.html

(cl:defclass <CheckPath-response> (roslisp-msg-protocol:ros-message)
  ((valid
    :reader valid
    :initarg :valid
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CheckPath-response (<CheckPath-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckPath-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckPath-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_planning_project-srv:<CheckPath-response> is deprecated: use rll_planning_project-srv:CheckPath-response instead.")))

(cl:ensure-generic-function 'valid-val :lambda-list '(m))
(cl:defmethod valid-val ((m <CheckPath-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_planning_project-srv:valid-val is deprecated.  Use rll_planning_project-srv:valid instead.")
  (valid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckPath-response>) ostream)
  "Serializes a message object of type '<CheckPath-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'valid) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckPath-response>) istream)
  "Deserializes a message object of type '<CheckPath-response>"
    (cl:setf (cl:slot-value msg 'valid) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckPath-response>)))
  "Returns string type for a service object of type '<CheckPath-response>"
  "rll_planning_project/CheckPathResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckPath-response)))
  "Returns string type for a service object of type 'CheckPath-response"
  "rll_planning_project/CheckPathResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckPath-response>)))
  "Returns md5sum for a message object of type '<CheckPath-response>"
  "9853809de3dea14e77435e7b0de1d74a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckPath-response)))
  "Returns md5sum for a message object of type 'CheckPath-response"
  "9853809de3dea14e77435e7b0de1d74a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckPath-response>)))
  "Returns full string definition for message of type '<CheckPath-response>"
  (cl:format cl:nil "bool valid~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckPath-response)))
  "Returns full string definition for message of type 'CheckPath-response"
  (cl:format cl:nil "bool valid~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckPath-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckPath-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckPath-response
    (cl:cons ':valid (valid msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CheckPath)))
  'CheckPath-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CheckPath)))
  'CheckPath-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckPath)))
  "Returns string type for a service object of type '<CheckPath>"
  "rll_planning_project/CheckPath")