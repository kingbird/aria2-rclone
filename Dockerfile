FROM alpine
RUN apk update && apk add git
RUN git clone https://github.com/kingbird/aria2-rclone.git
RUN cd aria2-rclone \
    && cp -rp ./conf/*  /root/ \
    && mv /root/aria2 /root/.aria2 \
    && mv /root/config /root/.config \
    && cp -rp aria2  /etc/init.d/ \
    && cp -rp bin/*  /usr/bin/ \
    && cp -rp entrypoint.sh /entrypoint.sh \
    && cp -rp ca-certificates.crt /etc/ssl/certs/ \
    && cd /root \
    && chmod +x /usr/bin/aria2c /usr/bin/rclone /usr/bin/filebrowser /etc/init.d/aria2 /entrypoint.sh /root/.config/rclone/up.sh
ENV rpc jaz

EXPOSE 51413 6800 80

ENTRYPOINT [ "sh", "/entrypoint.sh" ]