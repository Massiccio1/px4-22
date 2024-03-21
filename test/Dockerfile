FROM osrf/ros:humble-desktop-full as stage1

SHELL ["/bin/bash", "-c"]

# Update to latest version
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Rome"
RUN apt-get update

# install ros package
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-desktop \
    ros-${ROS_DISTRO}-demo-nodes-cpp \
    ros-${ROS_DISTRO}-demo-nodes-py 



CMD [ "/bin/bash" ]

