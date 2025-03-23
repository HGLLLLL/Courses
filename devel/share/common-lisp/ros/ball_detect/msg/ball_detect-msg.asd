
(cl:in-package :asdf)

(defsystem "ball_detect-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BoundingBox" :depends-on ("_package_BoundingBox"))
    (:file "_package_BoundingBox" :depends-on ("_package"))
    (:file "BoundingBoxArray" :depends-on ("_package_BoundingBoxArray"))
    (:file "_package_BoundingBoxArray" :depends-on ("_package"))
  ))