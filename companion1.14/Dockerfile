FROM drone-core:1.14 as stage1


COPY .bashrc /root/.bashrc
RUN mkdir -p /root/shared

RUN source /root/.bashrc


COPY . .

RUN chmod 777 entrypoint.sh

#CMD [ "/bin/bash" ]
CMD [ "./entrypoint.sh" ]


