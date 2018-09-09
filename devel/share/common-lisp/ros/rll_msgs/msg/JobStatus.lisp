; Auto-generated. Do not edit!


(cl:in-package rll_msgs-msg)


;//! \htmlinclude JobStatus.msg.html

(cl:defclass <JobStatus> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0)
   (status_detail
    :reader status_detail
    :initarg :status_detail
    :type cl:string
    :initform ""))
)

(cl:defclass JobStatus (<JobStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JobStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JobStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-msg:<JobStatus> is deprecated: use rll_msgs-msg:JobStatus instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <JobStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-msg:status-val is deprecated.  Use rll_msgs-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'status_detail-val :lambda-list '(m))
(cl:defmethod status_detail-val ((m <JobStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-msg:status_detail-val is deprecated.  Use rll_msgs-msg:status_detail instead.")
  (status_detail m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<JobStatus>)))
    "Constants for message type '<JobStatus>"
  '((:SUCCESS . 0)
    (:FAILURE . 1)
    (:INTERNAL_ERROR . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'JobStatus)))
    "Constants for message type 'JobStatus"
  '((:SUCCESS . 0)
    (:FAILURE . 1)
    (:INTERNAL_ERROR . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JobStatus>) ostream)
  "Serializes a message object of type '<JobStatus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status_detail))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status_detail))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JobStatus>) istream)
  "Deserializes a message object of type '<JobStatus>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_detail) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status_detail) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JobStatus>)))
  "Returns string type for a message object of type '<JobStatus>"
  "rll_msgs/JobStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JobStatus)))
  "Returns string type for a message object of type 'JobStatus"
  "rll_msgs/JobStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JobStatus>)))
  "Returns md5sum for a message object of type '<JobStatus>"
  "ded0e6920d3687094231ffc64e57394c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JobStatus)))
  "Returns md5sum for a message object of type 'JobStatus"
  "ded0e6920d3687094231ffc64e57394c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JobStatus>)))
  "Returns full string definition for message of type '<JobStatus>"
  (cl:format cl:nil "uint8 status~%uint8 SUCCESS = 0~%uint8 FAILURE = 1~%uint8 INTERNAL_ERROR = 2~%string status_detail~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JobStatus)))
  "Returns full string definition for message of type 'JobStatus"
  (cl:format cl:nil "uint8 status~%uint8 SUCCESS = 0~%uint8 FAILURE = 1~%uint8 INTERNAL_ERROR = 2~%string status_detail~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JobStatus>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'status_detail))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JobStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'JobStatus
    (cl:cons ':status (status msg))
    (cl:cons ':status_detail (status_detail msg))
))
