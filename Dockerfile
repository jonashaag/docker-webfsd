FROM alpine AS builder
ARG WEBFS_VERSION
RUN apk update && apk add build-base mailcap
RUN wget https://www.kraxel.org/releases/webfs/webfs-$WEBFS_VERSION.tar.gz -O - | tar xzf - \
 && cd webfs-$WEBFS_VERSION && make install && cd .. && rm -r webfs-$WEBFS_VERSION

FROM alpine
COPY --from=builder /etc/mime.types /etc/mime.types
COPY --from=builder /usr/local/bin/webfsd /usr/local/bin/webfsd
EXPOSE 80
CMD /usr/local/bin/webfsd -p 80 -d -r /srv
