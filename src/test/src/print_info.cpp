#include "ros/ros.h"

int main(int argc, char **argv)
{
  ros::init(argc, argv, "print_info");
  ros::NodeHandle nh;

  ROS_INFO("Hello World!");

  ros::Duration(1).sleep();

  return 0;
}