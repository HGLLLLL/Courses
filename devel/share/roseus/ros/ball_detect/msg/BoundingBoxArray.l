;; Auto-generated. Do not edit!


(when (boundp 'ball_detect::BoundingBoxArray)
  (if (not (find-package "BALL_DETECT"))
    (make-package "BALL_DETECT"))
  (shadow 'BoundingBoxArray (find-package "BALL_DETECT")))
(unless (find-package "BALL_DETECT::BOUNDINGBOXARRAY")
  (make-package "BALL_DETECT::BOUNDINGBOXARRAY"))

(in-package "ROS")
;;//! \htmlinclude BoundingBoxArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ball_detect::BoundingBoxArray
  :super ros::object
  :slots (_header _bounding_boxes ))

(defmethod ball_detect::BoundingBoxArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:bounding_boxes __bounding_boxes) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _bounding_boxes __bounding_boxes)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:bounding_boxes
   (&rest __bounding_boxes)
   (if (keywordp (car __bounding_boxes))
       (send* _bounding_boxes __bounding_boxes)
     (progn
       (if __bounding_boxes (setq _bounding_boxes (car __bounding_boxes)))
       _bounding_boxes)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ball_detect/BoundingBox[] _bounding_boxes
    (apply #'+ (send-all _bounding_boxes :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ball_detect/BoundingBox[] _bounding_boxes
     (write-long (length _bounding_boxes) s)
     (dolist (elem _bounding_boxes)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ball_detect/BoundingBox[] _bounding_boxes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bounding_boxes (let (r) (dotimes (i n) (push (instance ball_detect::BoundingBox :init) r)) r))
     (dolist (elem- _bounding_boxes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ball_detect::BoundingBoxArray :md5sum-) "10d92d3fbeeda5f8ba80518596202d8b")
(setf (get ball_detect::BoundingBoxArray :datatype-) "ball_detect/BoundingBoxArray")
(setf (get ball_detect::BoundingBoxArray :definition-)
      "Header header
BoundingBox[] bounding_boxes

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: ball_detect/BoundingBox
float32 x
float32 y
float32 w
float32 h
string bbox_class
float32 confidence



")



(provide :ball_detect/BoundingBoxArray "10d92d3fbeeda5f8ba80518596202d8b")


