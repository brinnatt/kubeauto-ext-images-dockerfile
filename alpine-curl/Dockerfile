FROM alpine:3.12

ENV CURL_VER=v7.85.0

COPY multi-platform-download.sh .

RUN sh -x ./multi-platform-download.sh

CMD [ "tail", "-f", "/dev/null" ]
