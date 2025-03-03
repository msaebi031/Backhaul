#!/bin/bash

ARCH=$(uname -m)
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
[ "$ARCH" = "x86_64" ] && ARCH="amd64" || ARCH="arm64"
FILE_NAME="backhaul_${OS}_${ARCH}.tar.gz"

echo "Downloading $FILE_NAME..."
curl -L -O "https://github.com/Musixal/Backhaul/releases/latest/download/$FILE_NAME"
if [ $? -ne 0 ]; then
    echo "Download failed!"
    exit 1
fi

mkdir -p /root/backhaul && tar -xzf "$FILE_NAME" -C /root/backhaul
if [ $? -ne 0 ]; then
    echo "Extraction failed!"
    exit 1
fi

rm -f "$FILE_NAME" /root/backhaul/LICENSE /root/backhaul/README.md
echo "Extraction successful, cleaned up files."

cd /root/backhaul/
