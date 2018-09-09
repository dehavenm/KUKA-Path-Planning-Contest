; Auto-generated. Do not edit!


(cl:in-package rll_msgs-msg)


;//! \htmlinclude JobExtraField.msg.html

(cl:defclass <JobExtraField> (roslisp-msg-protocol:ros-message)
  ((description
    :reader description
    :initarg :description
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:float
    :initform 0.0))
)

(cl:defclass JobExtraField (<JobExtraField>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JobExtraField>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JobExtraField)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-msg:<JobExtraField> is deprecated: use rll_msgs-msg:JobExtraField instead.")))

(cl:ensure-generic-function 'description-val :lambda-list '(m))
(cl:defmethod description-val ((m <JobExtraField>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-msg:description-val is deprecated.  Use rll_msgs-msg:description instead.")
  (description m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <JobExtraField>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-msg:value-val is deprecated.  Use rll_msgs-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JobExtraField>) ostream)
  "Serializes a message object of type '<JobExtraField>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'description))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'description))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JobExtraField>) istream)
  "Deserializes a message object of type '<JobExtraField>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'description) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'description) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JobExtraField>)))
  "Returns string type for a message object of type '<JobExtraField>"
  "rll_msgs/JobExtraField")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JobExtraField)))
  "Returns string type for a message object of type 'JobExtraField"
  "rll_msgs/JobExtraField")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JobExtraField>)))
  "Returns md5sum for a message object of type '<JobExtraField>"
  "b164c1ce471f8c5265ae1e8d22c2ca20")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JobExtraField)))
  "Returns md5sum for a message object of type 'JobExtraField"
  "b164c1ce471f8c5265ae1e8d22c2ca20")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JobExtraField>)))
  "Returns full string definition for message of type '<JobExtraField>"
  (cl:format cl:nil "string description~%float32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JobExtraField)))
  "Returns full string definition for message of type 'JobExtraField"
  (cl:format cl:nil "string description~%float32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JobExtraField>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'description))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JobExtraField>))
  "Converts a ROS message object to a list"
  (cl:list 'JobExtraField
    (cl:cons ':description (description msg))
    (cl:cons ':value (value msg))
))
