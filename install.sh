#!/bin/bash

ARCH=$(uname -m)
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
[ "$ARCH" = "x86_64" ] && ARCH="amd64" || ARCH="arm64"
FILE_NAME="backhaul_${OS}_${ARCH}.tar.gz"

echo "Downloading $FILE_NAME..."
curl -L -O "https://github.com/msaebi031/Backhaul/releases/latest/download/$FILE_NAME"

mkdir -p /root/backhaul && tar -xzf "$FILE_NAME" -C /root/backhaul && \
rm -f "$FILE_NAME" /root/backhaul/LICENSE /root/backhaul/README.md && \
echo "Extraction successful" || {
    echo "Extraction failed!"
    exit 1
}

cd /root/backhaul/
