#!/usr/bin/env python3
import rospy
import cv2
import threading
import numpy as np
from copy import deepcopy
from std_msgs.msg import Header
from ball_detect.msg import BoundingBox, BoundingBoxArray
from ultralytics import YOLO

class Monitor(threading.Thread):
    """
    以多執行緒方式擷取影像的類別
    """
    def __init__(self, camera_id):
        super(Monitor, self).__init__()
        self.camera_id = camera_id
        self.lock = threading.Lock()
        self.exit = False
        self.frame = np.zeros((0, 0, 3), dtype=np.uint8)

    def get_frame(self):
        """取得目前擷取到的影像"""
        return deepcopy(self.frame)
         
    def Exit(self):
        """通知執行緒結束"""
        self.exit = True

    def run(self): 
        cap = cv2.VideoCapture(self.camera_id)
        while not self.exit:
            ret, frame = cap.read()
            if not ret:
                break
            self.lock.acquire()
            self.frame = frame
            self.lock.release()
        cap.release()

class ObjectDetection:
    """
    使用 YOLO v8 模型來辨識影像中物件
    """
    def __init__(self, yolo_model_path, conf_threshold):
        self.model = self.load_model(yolo_model_path)
        self.classes = self.model.names
        self.device = 'cpu'
        print('\n\nDevice used: ', self.device, '\n')
        self.conf_threshold = conf_threshold

    def load_model(self, model_path):
        """從指定路徑載入 YOLO 模型"""
        model = YOLO(model_path)
        print("Model loaded")
        return model

    def score_frame(self, frame):
        """對影像進行推論"""
        self.model.to(self.device)
        results = self.model(frame)
        return results

    def class_to_label(self, x):
        """將數字標籤轉為字串"""
        return self.classes[int(x)]

    def plot_boxes(self, results, frame):
        """
        根據模型結果在影像上繪製 bounding box，
        並過濾掉信心值低於設定門檻的檢測，同時將 type 與 confidence 顯示於框旁
        """
        boxes = results[0].boxes.data.cpu().numpy()
        detections = []

        for box in boxes:
            x1, y1, x2, y2, conf, cls = box
            if conf < self.conf_threshold:
                continue 

            x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)
            width = x2 - x1
            height = y2 - y1
            cx = (x1 + x2) / 2
            cy = (y1 + y2) / 2

            detections.append({
                'x': cx,
                'y': cy,
                'w': width,
                'h': height,
                'class': self.class_to_label(cls),
                'confidence': conf
            })

            ########################################################
            ######################  Edit Here  #####################
            ########################################################
            
            # 標記框內顯示：type and condidence
            label = f"{self.class_to_label(cls)}: {conf:.2f}"
            cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 255, 0), 2)
            #format: frame, text, position, font, font size, color, thickness
            cv2.putText(frame, label, (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)

            ########################################################
            ########################## End #########################
            ########################################################

        return frame, detections

    def __call__(self, frame):
        results = self.score_frame(frame)
        frame, detections = self.plot_boxes(results, frame)
        return frame, detections

class ObjectDetectionPublisher:
    """
    結合影像擷取、物件檢測以及 ROS 訊息發布的主要邏輯
    """
    def __init__(self, camera_id, yolo_model_path, conf_threshold):
        self.camera_id = camera_id
        self.monitor = Monitor(camera_id)
        self.object_detector = ObjectDetection(yolo_model_path, conf_threshold)
        self.pub = rospy.Publisher('object_detection', BoundingBoxArray, queue_size=10)
        self.monitor.start()

    def run(self):
        while not rospy.is_shutdown():
            if cv2.waitKey(1) & 0xFF == ord('q'):
                self.monitor.Exit()
                break

            # 取得攝影機畫面
            frame = self.monitor.get_frame()

            if frame is not None and frame.size > 0:
                # 執行Object detect
                frame_processed, detections = self.object_detector(frame)
                cv2.imshow('Object Detection', frame_processed)

                bounding_boxes = BoundingBoxArray()
                bounding_boxes.header = Header()
                bounding_boxes.header.stamp = rospy.Time.now()

                for detection in detections:
                    bbox = BoundingBox()
                    bbox.x = detection['x']
                    bbox.y = detection['y']
                    bbox.w = detection['w']
                    bbox.h = detection['h']
                    bbox.bbox_class = detection['class']

                    try:
                        bbox.confidence = detection['confidence']
                    except AttributeError:
                        pass
                    bounding_boxes.bounding_boxes.append(bbox)

                self.pub.publish(bounding_boxes)
            else:
                rospy.logwarn("Failed to capture frame from camera.")

        self.monitor.join()
        cv2.destroyAllWindows()

if __name__ == '__main__':
    rospy.init_node('object_detection_publisher', anonymous=True)
    camera_id = rospy.get_param('~camera_id', 0)
    yolo_model = rospy.get_param('~yolo_model', '')
    conf_threshold = rospy.get_param('~conf_threshold', 0.5)
    detection_publisher = ObjectDetectionPublisher(camera_id, yolo_model, conf_threshold)
    detection_publisher.run()
