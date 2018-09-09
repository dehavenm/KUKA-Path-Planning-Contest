; Auto-generated. Do not edit!


(cl:in-package rll_msgs-srv)


;//! \htmlinclude MovePTP-request.msg.html

(cl:defclass <MovePTP-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass MovePTP-request (<MovePTP-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovePTP-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovePTP-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<MovePTP-request> is deprecated: use rll_msgs-srv:MovePTP-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <MovePTP-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:pose-val is deprecated.  Use rll_msgs-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovePTP-request>) ostream)
  "Serializes a message object of type '<MovePTP-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovePTP-request>) istream)
  "Deserializes a message object of type '<MovePTP-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovePTP-request>)))
  "Returns string type for a service object of type '<MovePTP-request>"
  "rll_msgs/MovePTPRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePTP-request)))
  "Returns string type for a service object of type 'MovePTP-request"
  "rll_msgs/MovePTPRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovePTP-request>)))
  "Returns md5sum for a message object of type '<MovePTP-request>"
  "b66f4c8c2fa81b98544cf0f3e10950ee")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovePTP-request)))
  "Returns md5sum for a message object of type 'MovePTP-request"
  "b66f4c8c2fa81b98544cf0f3e10950ee")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovePTP-request>)))
  "Returns full string definition for message of type '<MovePTP-request>"
  (cl:format cl:nil "geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovePTP-request)))
  "Returns full string definition for message of type 'MovePTP-request"
  (cl:format cl:nil "geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovePTP-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovePTP-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MovePTP-request
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude MovePTP-response.msg.html

(cl:defclass <MovePTP-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MovePTP-response (<MovePTP-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovePTP-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovePTP-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<MovePTP-response> is deprecated: use rll_msgs-srv:MovePTP-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MovePTP-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:success-val is deprecated.  Use rll_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovePTP-response>) ostream)
  "Serializes a message object of type '<MovePTP-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovePTP-response>) istream)
  "Deserializes a message object of type '<MovePTP-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovePTP-response>)))
  "Returns string type for a service object of type '<MovePTP-response>"
  "rll_msgs/MovePTPResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePTP-response)))
  "Returns string type for a service object of type 'MovePTP-response"
  "rll_msgs/MovePTPResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovePTP-response>)))
  "Returns md5sum for a message object of type '<MovePTP-response>"
  "b66f4c8c2fa81b98544cf0f3e10950ee")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovePTP-response)))
  "Returns md5sum for a message object of type 'MovePTP-response"
  "b66f4c8c2fa81b98544cf0f3e10950ee")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovePTP-response>)))
  "Returns full string definition for message of type '<MovePTP-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovePTP-response)))
  "Returns full string definition for message of type 'MovePTP-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovePTP-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovePTP-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MovePTP-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MovePTP)))
  'MovePTP-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MovePTP)))
  'MovePTP-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePTP)))
  "Returns string type for a service object of type '<MovePTP>"
  "rll_msgs/MovePTP")