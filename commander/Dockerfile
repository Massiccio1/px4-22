FROM drone-core:main as core

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


# ENV DISPLAY=:1 \
#     VNC_PORT=5901 \
#     NO_VNC_PORT=6901 \
#     VNC_COL_DEPTH=32 \
#     VNC_RESOLUTION=1920x1080

# # No interactive frontend during docker build
# ENV DEBIAN_FRONTEND=noninteractive


# RUN apt-get update && \
#     apt-get install --no-install-recommends -y \
#     xvfb xauth dbus-x11 xfce4 xfce4-terminal \
#     wget sudo curl gpg git bzip2 vim procps python x11-xserver-utils \
#     libnss3 libnspr4 libasound2 libgbm1 ca-certificates fonts-liberation xdg-utils \
#     tigervnc-standalone-server tigervnc-common firefox-esr; \
#     curl http://ftp.us.debian.org/debian/pool/main/liba/libappindicator/libappindicator3-1_0.4.92-7_amd64.deb --output /opt/libappindicator3-1_0.4.92-7_amd64.deb && \
#     curl http://ftp.us.debian.org/debian/pool/main/libi/libindicator/libindicator3-7_0.5.0-4_amd64.deb --output /opt/libindicator3-7_0.5.0-4_amd64.deb && \
#     apt-get install -y /opt/libappindicator3-1_0.4.92-7_amd64.deb /opt/libindicator3-7_0.5.0-4_amd64.deb; \
#     rm -vf /opt/lib*.deb; \
#     apt-get clean; \
#     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# ENV TERM xterm
# # Install NOVNC.

# RUN echo breakpoint

# WORKDIR /root

# RUN     git clone --branch v1.2.0 --single-branch https://github.com/novnc/noVNC.git /opt/noVNC; \
#     git clone --branch v0.9.0 --single-branch https://github.com/novnc/websockify.git /opt/noVNC/utils/websockify; \
#     ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html

# # disable shared memory X11 affecting Chromium
# ENV QT_X11_NO_MITSHM=1 \
#     _X11_NO_MITSHM=1 \
#     _MITSHM=0


# # give every user read write access to the "/root" folder where the binary is cached
# RUN ls -la /root
# RUN chmod 777 /root && mkdir /src

# EXPOSE 5901 6901

WORKDIR /root

COPY . .

RUN chmod 777 entrypoint.sh
COPY .bashrc /root/.bashrc
RUN mkdir -p /root/shared

RUN echo "alias python='python3'">> /root/.bashrc
RUN cp /usr/bin/python3 /usr/bin/python
RUN source /root/.bashrc

#CMD [ "/bin/bash" ]
CMD [ "./entrypoint.sh" ]

