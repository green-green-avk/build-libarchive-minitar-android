#!/bin/sh

set -e

BUILD_DIR='build'
VER='3.4.0'
NAME="libarchive-$VER"

mkdir -p "$BUILD_DIR"
(
cd "$BUILD_DIR"
wget -O - "https://www.libarchive.org/downloads/$NAME.tar.gz" | tar -xz
)

export TARGET_SRC_DIR=$(realpath -s "$BUILD_DIR/$NAME")

export NDK_PROJECT_PATH="$BUILD_DIR"
ndk-build NDK_APPLICATION_MK=./App-all.mk

mkdir -p 'prebuilt'
cp -a "$BUILD_DIR/libs/"* 'prebuilt'
