#include "ros/ros.h"
#include "std_msgs/Int32.h"

int main(int argc, char** argv)
{
  // 初始化節點，節點名稱為 publisher_topic1
  ros::init(argc, argv, "publisher_topic1");
  ros::NodeHandle nh;

  // 建立 Publisher，發布型態為 std_msgs::Int32，Topic 名稱為 topic1
  ros::Publisher pub = nh.advertise<std_msgs::Int32>("topic1", 10);

  ros::Rate loop_rate(1); // 設定發布頻率 1 Hz

  while (ros::ok())
  {
    std_msgs::Int32 msg;
    msg.data = 1;

    // 發布訊息
    pub.publish(msg);
    ROS_INFO("Published %d on topic1", msg.data);

    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}