# Download harbor offline-package needed by kubeauto

FROM alpine:3.16

ENV HARBOR_VER=v2.13.0

RUN apk add --no-cache wget
COPY multi-platform-download.sh /download-harbor.sh
RUN chmod +x /download-harbor.sh && \
    /download-harbor.sh "${HARBOR_VER}"

CMD [ "tail", "-f", "/dev/null" ]
