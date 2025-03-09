#include <ros/ros.h>
#include <sensor_msgs/Range.h>
#include <std_msgs/Float64.h>
#include <cmath>

class AngleCalculator
{
public:
  AngleCalculator() : initial_distance_set(false), sum_distance(0.0), count(0)
  {
    // Get the lidar topic name from parameter server.
    // The default value here is "/TFmini" (global namespace)
    ros::NodeHandle nh_private("~");
    std::string lidar_topic;
    nh_private.param<std::string>("lidar_topic", lidar_topic, "/TFmini");

    // Subscribe to the lidar topic using the global node handle.
    sub_ = nh_.subscribe(lidar_topic, 1000, &AngleCalculator::lidarCallback, this);
    
    // Create a publisher to publish the calculated angle.
    angle_pub_ = nh_.advertise<std_msgs::Float64>("calculated_angle", 1000);

    start_time_ = ros::Time::now();
    ROS_INFO("Subscribed to lidar topic: %s", lidar_topic.c_str());
  }
  
  void lidarCallback(const sensor_msgs::Range::ConstPtr& msg)
  {
    // During the first 3 seconds, accumulate data to calculate the initial distance (D0)
    if (!initial_distance_set)
    {
      ros::Duration elapsed = ros::Time::now() - start_time_; //the format of ros::Time::now() is hh:mm:ss
      if (elapsed.toSec() < 3.0) //ths func of elapsed is toSec() is to convert the time to seconds
      {
         sum_distance += msg->range;
         count++;
         return;
      }
      else
      {
         if(count > 0) {
           initial_distance_ = sum_distance / count;
           initial_distance_set = true;
           ROS_INFO("Initial distance (D0): %f", initial_distance_);
         } else {
           ROS_ERROR("No valid initial data received!");
           return;
         }
      }
    }
    
    // Once the initial distance is set, compute the angle based on current reading.
    double current_distance = msg->range;
    if (current_distance >= initial_distance_) {
      double ratio = initial_distance_ / current_distance;
      // Clamp ratio to 1 to avoid domain errors in acos
      if (ratio > 1.0)
        ratio = 1.0;
      double angle_rad = acos(ratio);
      double angle_deg = angle_rad * 180.0 / M_PI;
      ROS_INFO("Current distance: %f, Calculated angle: %f degrees", current_distance, angle_deg);
      
      // Publish the calculated angle
      std_msgs::Float64 angle_msg;
      angle_msg.data = angle_deg;
      angle_pub_.publish(angle_msg);
    } else {
      ROS_WARN("Current distance is less than initial distance, cannot calculate angle.");
    }
  }

private:
  ros::NodeHandle nh_; // Global node handle
  ros::Subscriber sub_;
  ros::Publisher angle_pub_;
  ros::Time start_time_;
  bool initial_distance_set;
  double initial_distance_;
  double sum_distance;
  int count;
};

int main(int argc, char** argv)
{
  ros::init(argc, argv, "angle_calculator_node");
  AngleCalculator ac;
  ros::spin();
  return 0;
}
