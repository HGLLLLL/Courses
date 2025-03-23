; Auto-generated. Do not edit!


(cl:in-package ball_detect-msg)


;//! \htmlinclude BoundingBoxArray.msg.html

(cl:defclass <BoundingBoxArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (bounding_boxes
    :reader bounding_boxes
    :initarg :bounding_boxes
    :type (cl:vector ball_detect-msg:BoundingBox)
   :initform (cl:make-array 0 :element-type 'ball_detect-msg:BoundingBox :initial-element (cl:make-instance 'ball_detect-msg:BoundingBox))))
)

(cl:defclass BoundingBoxArray (<BoundingBoxArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoundingBoxArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoundingBoxArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ball_detect-msg:<BoundingBoxArray> is deprecated: use ball_detect-msg:BoundingBoxArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BoundingBoxArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ball_detect-msg:header-val is deprecated.  Use ball_detect-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'bounding_boxes-val :lambda-list '(m))
(cl:defmethod bounding_boxes-val ((m <BoundingBoxArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ball_detect-msg:bounding_boxes-val is deprecated.  Use ball_detect-msg:bounding_boxes instead.")
  (bounding_boxes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoundingBoxArray>) ostream)
  "Serializes a message object of type '<BoundingBoxArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bounding_boxes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bounding_boxes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoundingBoxArray>) istream)
  "Deserializes a message object of type '<BoundingBoxArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'bounding_boxes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'bounding_boxes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ball_detect-msg:BoundingBox))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoundingBoxArray>)))
  "Returns string type for a message object of type '<BoundingBoxArray>"
  "ball_detect/BoundingBoxArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoundingBoxArray)))
  "Returns string type for a message object of type 'BoundingBoxArray"
  "ball_detect/BoundingBoxArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoundingBoxArray>)))
  "Returns md5sum for a message object of type '<BoundingBoxArray>"
  "10d92d3fbeeda5f8ba80518596202d8b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoundingBoxArray)))
  "Returns md5sum for a message object of type 'BoundingBoxArray"
  "10d92d3fbeeda5f8ba80518596202d8b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoundingBoxArray>)))
  "Returns full string definition for message of type '<BoundingBoxArray>"
  (cl:format cl:nil "Header header~%BoundingBox[] bounding_boxes~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ball_detect/BoundingBox~%float32 x~%float32 y~%float32 w~%float32 h~%string bbox_class~%float32 confidence~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoundingBoxArray)))
  "Returns full string definition for message of type 'BoundingBoxArray"
  (cl:format cl:nil "Header header~%BoundingBox[] bounding_boxes~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ball_detect/BoundingBox~%float32 x~%float32 y~%float32 w~%float32 h~%string bbox_class~%float32 confidence~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoundingBoxArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bounding_boxes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoundingBoxArray>))
  "Converts a ROS message object to a list"
  (cl:list 'BoundingBoxArray
    (cl:cons ':header (header msg))
    (cl:cons ':bounding_boxes (bounding_boxes msg))
))
