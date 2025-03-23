;; Auto-generated. Do not edit!


(when (boundp 'ball_detect::BoundingBox)
  (if (not (find-package "BALL_DETECT"))
    (make-package "BALL_DETECT"))
  (shadow 'BoundingBox (find-package "BALL_DETECT")))
(unless (find-package "BALL_DETECT::BOUNDINGBOX")
  (make-package "BALL_DETECT::BOUNDINGBOX"))

(in-package "ROS")
;;//! \htmlinclude BoundingBox.msg.html


(defclass ball_detect::BoundingBox
  :super ros::object
  :slots (_x _y _w _h _bbox_class _confidence ))

(defmethod ball_detect::BoundingBox
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:w __w) 0.0)
    ((:h __h) 0.0)
    ((:bbox_class __bbox_class) "")
    ((:confidence __confidence) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _w (float __w))
   (setq _h (float __h))
   (setq _bbox_class (string __bbox_class))
   (setq _confidence (float __confidence))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:bbox_class
   (&optional __bbox_class)
   (if __bbox_class (setq _bbox_class __bbox_class)) _bbox_class)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _w
    4
    ;; float32 _h
    4
    ;; string _bbox_class
    4 (length _bbox_class)
    ;; float32 _confidence
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _w
       (sys::poke _w (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _h
       (sys::poke _h (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _bbox_class
       (write-long (length _bbox_class) s) (princ _bbox_class s)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _w
     (setq _w (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _h
     (setq _h (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _bbox_class
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _bbox_class (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ball_detect::BoundingBox :md5sum-) "951d96f0b69ae98de978cdaf0668263a")
(setf (get ball_detect::BoundingBox :datatype-) "ball_detect/BoundingBox")
(setf (get ball_detect::BoundingBox :definition-)
      "float32 x
float32 y
float32 w
float32 h
string bbox_class
float32 confidence



")



(provide :ball_detect/BoundingBox "951d96f0b69ae98de978cdaf0668263a")


