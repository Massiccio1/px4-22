#!/bin/bash



trap ctrl_c INT

function ctrl_c() {
        echo "** Trapped CTRL-C"
        exit 0
}

source ~/.bashrc ; source /opt/ros/humble/setup.bash ; source ~/ros2_ws/install/setup.bash ; true
TRACKED_ROBOT_ID=44 ros2 run optitrack_interface optitrack &
python3 ~/ros2_ws/src/px4-py/src/opti-to-px4.py &


sudo MicroXRCEAgent serial --dev /dev/ttyS2 -b 921600 & 

bash