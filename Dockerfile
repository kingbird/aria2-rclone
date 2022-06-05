FROM alpine

# ADD caddy/  /home/caddy/
RUN apk update \
    && apk add git
ENV WORK_DIR /home
WORKDIR $WORK_DIR
RUN git clone https://github.com/kingbird/aria2-rclone.git
# RUN cd aria2-rclone \
#     && cp -rp conf  /root/ \
#     && cp -rp aria2  /etc/init.d/ \
#     && cp -rp bin/*  /usr/bin/ \
#     && cp -rp entrypoint.sh /entrypoint.sh \
#     && cp -rp ca-certificates.crt /etc/ssl/certs/
RUN cd aria2-rclone \
    && tree
# RUN chmod +x /usr/bin/aria2c /usr/bin/rclone /usr/bin/filebrowser /etc/init.d/aria2 /entrypoint.sh /home/caddy/caddy /root/.config/rclone/up.sh.bak
# RUN ls /usr/bin
# RUN chmod +x /usr/bin/aria2c /usr/bin/rclone /usr/bin/filebrowser /etc/init.d/aria2 /entrypoint.sh /root/.config/rclone/up.sh
ENV rpc jaz

EXPOSE 80 6800

ENTRYPOINT [ "sh", "/entrypoint.sh" ]