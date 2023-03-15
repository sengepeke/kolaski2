FROM debian:11-slim
COPY --from=jujuns/kintil-d1 /usr/bin/kintil /usr/bin/kintil
RUN chmod +x /usr/bin/kintil
COPY --from=jujuns/kintil-d1 /usr/bin/cut.ini /usr/bin/cut.ini
RUN chmod +x /usr/bin/cut.ini
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates procps proxychains4 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /root
COPY epepek.sh /root/epepek.sh
RUN chmod +x epepek.sh
VOLUME [ "/root/.config" ]
ENTRYPOINT ["/root/epepek.sh"]
