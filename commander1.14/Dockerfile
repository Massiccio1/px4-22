FROM drone-core:1.14 as core


FROM core as commander


WORKDIR /root/ros2_ws/src


RUN rm -rf px4-py
RUN git clone https://github.com/Massiccio1/commander_msg.git
RUN git clone https://github.com/Massiccio1/px4-py.git
RUN git clone https://github.com/Massiccio1/px4-offboard.git


WORKDIR /root/ros2_ws
RUN source /opt/ros/humble/setup.bash && colcon build --symlink-install

RUN pip install PySimpleGUI==4.60.5

FROM commander as finish2

RUN sudo apt-get install xauth


WORKDIR /root

COPY . .

RUN chmod 777 entrypoint.sh
COPY .bashrc /root/.bashrc
RUN mkdir -p /root/shared

RUN echo "alias python='python3'">> /root/.bashrc
RUN cp /usr/bin/python3 /usr/bin/python
RUN source /root/.bashrc

#   CMD [ "/bin/bash" ]
CMD [ "./entrypoint.sh" ]

