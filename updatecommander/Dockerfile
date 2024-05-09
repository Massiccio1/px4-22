FROM drone-commander:main-squash

WORKDIR /root/ros2_ws/src/
RUN cd commander_msg ; git fetch ; git reset --hard origin/master

WORKDIR /root/ros2_ws/src/
RUN cd px4-py ; git fetch ; git reset --hard origin/master

WORKDIR /root/ros2_ws
RUN source /opt/ros/humble/setup.bash && colcon build --symlink-install --parallel-workers 8



CMD [ "./entrypoint.sh" ]

