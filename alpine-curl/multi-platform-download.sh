#!/bin/sh
ARC=$(uname -m)
ARCH="amd64"

case "$ARC" in
  x86_64)
      ARCH="amd64"
      ;;
  aarch64)
      ARCH="aarch64"
      ;;
  ?)
      echo "error: not supported platform right now, exit"
      exit 1
      ;;
esac

wget https://github.com/moparisthebest/static-curl/releases/download/${CURL_VER}/curl-${ARCH} && \
mv ./curl-${ARCH} /bin/curl && \
chmod +x /bin/curl
