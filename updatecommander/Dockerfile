FROM drone-commander:main-squash

WORKDIR /root/ros2_ws/src/
RUN cd px4-py && git pull

WORKDIR /root/ros2_ws
RUN source /opt/ros/humble/setup.bash && colcon build --symlink-install --parallel-workers 8


CMD [ "./entrypoint.sh" ]

