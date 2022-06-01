#!/bin/bash
set -x

if [[ $CONDA_BUILD_CROSS_COMPILATION == "1" ]]; then
    # Get an updated config.sub and config.guess
    cp $BUILD_PREFIX/share/gnuconfig/config.* .
fi

./configure --prefix=$PREFIX \
            --with-trust-paths=$PREFIX/ssl/cert.pem
make
make install
