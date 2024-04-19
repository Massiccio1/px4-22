FROM commander-humble

WORKDIR /root/ros2_ws/src/px4-py
RUN touch COLCON_IGNORE

WORKDIR /root/ros2_ws/src/px4-offboard
RUN touch COLCON_IGNORE

WORKDIR /root/ros2_ws/src/commander_msg
RUN touch COLCON_IGNORE

RUN rm -rf COLCON_IGONRE

WORKDIR /root/ros2_ws/src/px4_msgs

RUN rm -rf COLCON_IGONRE

RUN git checkout main
RUN git pull




WORKDIR /root/ros2_ws/src

RUN source /root/.bashrc && colcon build --symlink-install  --parallel-workers 6

CMD ["bash"]

#docker build -t extra .

#docker run --rm -it extra bash