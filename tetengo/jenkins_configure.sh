#!/bin/sh

SOURCE_TOP=$1

export DISTCHECK_CONFIGURE_FLAGS=" \
"

./bootstrap.sh
mkdir build
cd build
../configure $DISTCHECK_CONFIGURE_FLAGS
