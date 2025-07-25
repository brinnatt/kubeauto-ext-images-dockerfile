#!/bin/sh

set -euo pipefail

# check params
if [ $# -ne 1 ]; then
    echo "Usage: $0 <harbor_version>"
    exit 1
fi

HARBOR_VER=$1

# detect cpu arch
case "$(uname -m)" in
    aarch64|arm64) ARCH="aarch64" ;;
    x86_64|amd64)  ARCH="x86_64" ;;
    *)             echo "Unsupported architecture: $(uname -m)"; exit 1 ;;
esac

# construct URL
BASE_URL="https://github.com"
if [ "$ARCH" = "aarch64" ]; then
    REPO_PATH="wise2c-devops/build-harbor-aarch64"
    FILE_NAME="harbor-offline-installer-aarch64-${HARBOR_VER}.tgz"
else
    REPO_PATH="goharbor/harbor"
    FILE_NAME="harbor-offline-installer-${HARBOR_VER}.tgz"
fi

DOWNLOAD_URL="${BASE_URL}/${REPO_PATH}/releases/download/${HARBOR_VER}/${FILE_NAME}"
OUTPUT_FILE="/harbor/${FILE_NAME}"

# 创建目录并下载
mkdir -p /harbor
echo "Downloading Harbor ${HARBOR_VER} for ${ARCH} from ${DOWNLOAD_URL}"
if ! wget -O "${OUTPUT_FILE}" "${DOWNLOAD_URL}"; then
    echo "Failed to download Harbor"
    exit 1
fi

echo "Successfully downloaded to ${OUTPUT_FILE}"