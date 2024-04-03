#!/bin/bash

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        echo "** Trapped CTRL-C"
        exit 0
}
cd /root
source ~/.bashrc ; source /opt/ros/humble/setup.bash ; source ~/ros2_ws/install/setup.bash ; true
python3 ~/ros2_ws/src/px4-py/src/px4-py.py &
cd  ~/ros2_ws/src/px4-py/src && python3 gui.py &
cd ~
bash