; Auto-generated. Do not edit!


(cl:in-package rll_msgs-srv)


;//! \htmlinclude PickPlace-request.msg.html

(cl:defclass <PickPlace-request> (roslisp-msg-protocol:ros-message)
  ((pose_above
    :reader pose_above
    :initarg :pose_above
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (pose_grip
    :reader pose_grip
    :initarg :pose_grip
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (gripper_close
    :reader gripper_close
    :initarg :gripper_close
    :type cl:boolean
    :initform cl:nil)
   (grasp_object
    :reader grasp_object
    :initarg :grasp_object
    :type cl:string
    :initform ""))
)

(cl:defclass PickPlace-request (<PickPlace-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PickPlace-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PickPlace-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<PickPlace-request> is deprecated: use rll_msgs-srv:PickPlace-request instead.")))

(cl:ensure-generic-function 'pose_above-val :lambda-list '(m))
(cl:defmethod pose_above-val ((m <PickPlace-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:pose_above-val is deprecated.  Use rll_msgs-srv:pose_above instead.")
  (pose_above m))

(cl:ensure-generic-function 'pose_grip-val :lambda-list '(m))
(cl:defmethod pose_grip-val ((m <PickPlace-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:pose_grip-val is deprecated.  Use rll_msgs-srv:pose_grip instead.")
  (pose_grip m))

(cl:ensure-generic-function 'gripper_close-val :lambda-list '(m))
(cl:defmethod gripper_close-val ((m <PickPlace-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:gripper_close-val is deprecated.  Use rll_msgs-srv:gripper_close instead.")
  (gripper_close m))

(cl:ensure-generic-function 'grasp_object-val :lambda-list '(m))
(cl:defmethod grasp_object-val ((m <PickPlace-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:grasp_object-val is deprecated.  Use rll_msgs-srv:grasp_object instead.")
  (grasp_object m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PickPlace-request>) ostream)
  "Serializes a message object of type '<PickPlace-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose_above) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose_grip) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gripper_close) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'grasp_object))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'grasp_object))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PickPlace-request>) istream)
  "Deserializes a message object of type '<PickPlace-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose_above) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose_grip) istream)
    (cl:setf (cl:slot-value msg 'gripper_close) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'grasp_object) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'grasp_object) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PickPlace-request>)))
  "Returns string type for a service object of type '<PickPlace-request>"
  "rll_msgs/PickPlaceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickPlace-request)))
  "Returns string type for a service object of type 'PickPlace-request"
  "rll_msgs/PickPlaceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PickPlace-request>)))
  "Returns md5sum for a message object of type '<PickPlace-request>"
  "f9e1ce2e36454c554259d3461e945fff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PickPlace-request)))
  "Returns md5sum for a message object of type 'PickPlace-request"
  "f9e1ce2e36454c554259d3461e945fff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PickPlace-request>)))
  "Returns full string definition for message of type '<PickPlace-request>"
  (cl:format cl:nil "geometry_msgs/Pose pose_above~%geometry_msgs/Pose pose_grip~%bool gripper_close~%string grasp_object~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PickPlace-request)))
  "Returns full string definition for message of type 'PickPlace-request"
  (cl:format cl:nil "geometry_msgs/Pose pose_above~%geometry_msgs/Pose pose_grip~%bool gripper_close~%string grasp_object~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PickPlace-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose_above))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose_grip))
     1
     4 (cl:length (cl:slot-value msg 'grasp_object))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PickPlace-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PickPlace-request
    (cl:cons ':pose_above (pose_above msg))
    (cl:cons ':pose_grip (pose_grip msg))
    (cl:cons ':gripper_close (gripper_close msg))
    (cl:cons ':grasp_object (grasp_object msg))
))
;//! \htmlinclude PickPlace-response.msg.html

(cl:defclass <PickPlace-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PickPlace-response (<PickPlace-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PickPlace-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PickPlace-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<PickPlace-response> is deprecated: use rll_msgs-srv:PickPlace-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <PickPlace-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:success-val is deprecated.  Use rll_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PickPlace-response>) ostream)
  "Serializes a message object of type '<PickPlace-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PickPlace-response>) istream)
  "Deserializes a message object of type '<PickPlace-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PickPlace-response>)))
  "Returns string type for a service object of type '<PickPlace-response>"
  "rll_msgs/PickPlaceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickPlace-response)))
  "Returns string type for a service object of type 'PickPlace-response"
  "rll_msgs/PickPlaceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PickPlace-response>)))
  "Returns md5sum for a message object of type '<PickPlace-response>"
  "f9e1ce2e36454c554259d3461e945fff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PickPlace-response)))
  "Returns md5sum for a message object of type 'PickPlace-response"
  "f9e1ce2e36454c554259d3461e945fff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PickPlace-response>)))
  "Returns full string definition for message of type '<PickPlace-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PickPlace-response)))
  "Returns full string definition for message of type 'PickPlace-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PickPlace-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PickPlace-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PickPlace-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PickPlace)))
  'PickPlace-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PickPlace)))
  'PickPlace-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickPlace)))
  "Returns string type for a service object of type '<PickPlace>"
  "rll_msgs/PickPlace")