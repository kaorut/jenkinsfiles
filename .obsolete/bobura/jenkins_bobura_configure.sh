#!/bin/sh

SOURCE_TOP=$1

export DISTCHECK_CONFIGURE_FLAGS=" \
  --with-clang-format=clang-format-5.0 \
  --with-tetengo2-includedir=$SOURCE_TOP/lib/tetengo2/tetengo2/include \
  --with-tetengo2-libdir=$SOURCE_TOP/lib/tetengo2/tetengo2/src \
  --with-tetengo2-detail-includedir=$SOURCE_TOP/lib/tetengo2/tetengo2_detail/include \
  --with-tetengo2-detail-libdir=$SOURCE_TOP/lib/tetengo2/tetengo2_detail/src \
  --with-tetengo2-gui-includedir=$SOURCE_TOP/lib/tetengo2/tetengo2_gui/include \
  --with-tetengo2-gui-libdir=$SOURCE_TOP/lib/tetengo2/tetengo2_gui/src \
  --with-tetengo2-toolsdir=$SOURCE_TOP/lib/tetengo2/tools \
"

./tools/checkout_and_build_tetengo2.sh "$SOURCE_TOP" '--with-clang-format=clang-format-5.0' '-j8'

./bootstrap.sh
mkdir build
cd build
../configure $DISTCHECK_CONFIGURE_FLAGS
