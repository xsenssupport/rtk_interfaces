cmake_minimum_required(VERSION 3.8)
project(rtk_interfaces)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# Find required packages
find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(std_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)

# Generate interfaces
rosidl_generate_interfaces(${PROJECT_NAME}
  "msg/BaselineStatus.msg"
  "msg/GNSSStatus.msg"
  "msg/Satellite.msg"
  DEPENDENCIES
    std_msgs
    sensor_msgs
)

ament_package()