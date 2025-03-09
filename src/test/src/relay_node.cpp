#include "ros/ros.h"
#include "std_msgs/Int32.h"

// 宣告全域 Publisher 變數，用於發布到 topic2
ros::Publisher pub_topic2;

// 回呼函數：處理從 topic1 接收到的訊息
void callback(const std_msgs::Int32::ConstPtr& msg)
{
  ROS_INFO("Received %d from topic1", msg->data);

  std_msgs::Int32 new_msg;
  new_msg.data = msg->data + 1;

  // 發布處理後的訊息到 topic2
  pub_topic2.publish(new_msg);
  ROS_INFO("Published %d on topic2", new_msg.data);
}

int main(int argc, char** argv)
{
  // 初始化節點，節點名稱為 relay_node
  ros::init(argc, argv, "relay_node");
  ros::NodeHandle nh;

  // 建立 Publisher，發布到 topic2
  pub_topic2 = nh.advertise<std_msgs::Int32>("topic2", 10);

  // 訂閱 topic1，並設定回呼函數
  ros::Subscriber sub = nh.subscribe("topic1", 10, callback);

  // 進入事件循環，等待訊息
  ros::spin();

  return 0;
}
