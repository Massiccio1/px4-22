#!/bin/bash
# set -e: exit asap if a command exits with a non-zero status
cd /root
source ~/.bashrc ; source /opt/ros/humble/setup.bash ; source ~/ros2_ws/install/setup.bash ; true
cd ~/ros2_ws/src/px4-py/src && python3 px4-py.py &
cd  ~/ros2_ws/src/px4-py/src && python3 gui.py &
cd ~
bash