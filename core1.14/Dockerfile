FROM ros:humble as stage1

SHELL ["/bin/bash", "-c"]

# Update to latest version
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Rome"
RUN apt-get update

# install ros package
RUN sed -i 's|http://ports.ubuntu.com|http://mirrors.mit.edu|g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nala
RUN nala update
RUN nala install -y  ros-${ROS_DISTRO}-desktop 
RUN nala install -y  ros-${ROS_DISTRO}-demo-nodes-cpp 
RUN nala install -y  ros-${ROS_DISTRO}-demo-nodes-py 
RUN apt install -y ros-dev-tools 
RUN apt install -y git
RUN apt install -y python3-pip


RUN pip install setuptools==58.2.0

WORKDIR /root

FROM stage1 as px4

RUN git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
WORKDIR /root/Micro-XRCE-DDS-Agent
RUN mkdir build
WORKDIR /root/Micro-XRCE-DDS-Agent/build
RUN cmake ..
RUN make -j8
RUN make install
RUN ldconfig /usr/local/lib/


FROM px4 as stage2

RUN mkdir -p ros2_ws/source
WORKDIR /root/ros2_ws/src

RUN  source /opt/ros/humble/setup.bash

RUN git clone https://github.com/Massiccio1/px4-py.git
RUN git clone https://github.com/Massiccio1/optitrack_interface.git
RUN git clone --no-checkout  https://github.com/PX4/px4_msgs.git
RUN cd px4_msgs && git checkout release/1.14
RUN git clone --no-checkout  https://github.com/PX4/px4_ros_com.git
RUN cd px4_ros_com && git checkout release/v1.14

FROM stage2 as realsense
# RUN git clone https://github.com/IntelRealSense/realsense-ros.git
RUN apt install -y ros-$ROS_DISTRO-librealsense2-*
RUN apt-get install -y ros-humble-realsense2-camera

WORKDIR /root/ros2_ws
RUN source /opt/ros/humble/setup.bash && colcon build --symlink-install --parallel-workers 8


# -------------------------------------------------------------------------------------------------------

RUN touch src/optitrack_interface/COLCON_IGNORE 
RUN touch src/px4_msgs/COLCON_IGNORE 
RUN touch src/px4_ros_com/COLCON_IGNORE
RUN touch src/px4-py/COLCON_IGNORE
# RUN touch src/realsense-ros/COLCON_IGNORE 


FROM realsense as finish

RUN apt-get install ros-$ROS_DISTRO-rosbag2

