;; Auto-generated. Do not edit!


(when (boundp 'rll_msgs::JobStatus)
  (if (not (find-package "RLL_MSGS"))
    (make-package "RLL_MSGS"))
  (shadow 'JobStatus (find-package "RLL_MSGS")))
(unless (find-package "RLL_MSGS::JOBSTATUS")
  (make-package "RLL_MSGS::JOBSTATUS"))

(in-package "ROS")
;;//! \htmlinclude JobStatus.msg.html


(intern "*SUCCESS*" (find-package "RLL_MSGS::JOBSTATUS"))
(shadow '*SUCCESS* (find-package "RLL_MSGS::JOBSTATUS"))
(defconstant rll_msgs::JobStatus::*SUCCESS* 0)
(intern "*FAILURE*" (find-package "RLL_MSGS::JOBSTATUS"))
(shadow '*FAILURE* (find-package "RLL_MSGS::JOBSTATUS"))
(defconstant rll_msgs::JobStatus::*FAILURE* 1)
(intern "*INTERNAL_ERROR*" (find-package "RLL_MSGS::JOBSTATUS"))
(shadow '*INTERNAL_ERROR* (find-package "RLL_MSGS::JOBSTATUS"))
(defconstant rll_msgs::JobStatus::*INTERNAL_ERROR* 2)
(defclass rll_msgs::JobStatus
  :super ros::object
  :slots (_status _status_detail ))

(defmethod rll_msgs::JobStatus
  (:init
   (&key
    ((:status __status) 0)
    ((:status_detail __status_detail) "")
    )
   (send-super :init)
   (setq _status (round __status))
   (setq _status_detail (string __status_detail))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:status_detail
   (&optional __status_detail)
   (if __status_detail (setq _status_detail __status_detail)) _status_detail)
  (:serialization-length
   ()
   (+
    ;; uint8 _status
    1
    ;; string _status_detail
    4 (length _status_detail)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _status
       (write-byte _status s)
     ;; string _status_detail
       (write-long (length _status_detail) s) (princ _status_detail s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _status_detail
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status_detail (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get rll_msgs::JobStatus :md5sum-) "ded0e6920d3687094231ffc64e57394c")
(setf (get rll_msgs::JobStatus :datatype-) "rll_msgs/JobStatus")
(setf (get rll_msgs::JobStatus :definition-)
      "uint8 status
uint8 SUCCESS = 0
uint8 FAILURE = 1
uint8 INTERNAL_ERROR = 2
string status_detail

")



(provide :rll_msgs/JobStatus "ded0e6920d3687094231ffc64e57394c")


