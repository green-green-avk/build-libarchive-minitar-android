#!/bin/sh

set -e

( cd bzip2 && ./build.sh )
( cd lzma && ./build.sh )

BUILD_DIR='build'
VER='3.5.1'
NAME="libarchive-$VER"

mkdir -p "$BUILD_DIR"
(
cd "$BUILD_DIR"
wget -O - "https://www.libarchive.org/downloads/$NAME.tar.gz" | tar -xz
)

export TARGET_SRC_DIR="$(realpath -s "$BUILD_DIR/$NAME")"

patch -i "$(realpath -s android.patch)" -p0 -d "$TARGET_SRC_DIR"

export NDK_PROJECT_PATH="$BUILD_DIR"
ndk-build NDK_APPLICATION_MK=./App-all.mk

mkdir -p 'prebuilt'
cp -a "$BUILD_DIR/libs/"* 'prebuilt'
