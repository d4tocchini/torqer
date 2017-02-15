FROM alpine:edge

EXPOSE 8118 9050 53

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
 && apk --update add \
 		privoxy \
 		tor@testing \
 		runit@testing

ADD ./torqer /opt/torqer

RUN adduser -D -u 1000 torqer \
 && chown -R torqer /opt/torqer

CMD ["runsvdir", "/opt/torqer"]
